class Buster
  require_relative 'site_config'
  require 'webrick'
  require 'git'
  require 'fileutils'
  
  def self.setup(name, repo_url, dir, local_url, domain, git_email, git_name)
    FileUtils::mkdir_p dir unless File.directory?(dir)
    
    remove_all_contents(dir)
    repo = Git::Base.init(dir)
    repo.add_remote('origin', repo_url)
    
    if git_name
      repo.config('user.name', git_name)
    end
    if git_email
      repo.config('user.email', git_email)
    end
    
    File.open(File.join(dir, 'README.md'), 'w') {|f| f.write('# \n\n Powered by [Ghost](http://ghost.org).\n')}
    
    repo.add(:all => true)
    repo.commit('Initial commit. Add README.md.')
    
    checkout_branch(repo, repo_url)
    
    SiteConfig.new_site(name, repo_url, dir, domain, local_url)
  end
  
  private
  def self.checkout_branch(repo, repo_url)
    # User/Organization page -> master branch
    # Project page -> gh-pages branch
    branch_name = 'gh-pages'
    if repo_url =~ /.*[\w-]+\.github\.(?:io|com).*/
      branch_name = 'master'
    end
    
    repo.branch(branch_name).create
    repo.branch(branch_name).checkout
    
    branch_name
  end
  
  private
  def self.remove_all_contents(dir)
    FileUtils.rm_rf(Dir.glob(dir))
  end
  
  def self.generate(name)
    repo = Git::Base.init(SiteConfig.get_local_location(name))
    checkout_branch(repo, SiteConfig.get_repo_url(name)) # Checkout branch now instead of stash later.

    command = "wget \\" +
      "--recursive \\" + # follow links to download entire site
      "--convert-links \\" + # make links relative
      "--page-requisites \\" + # grab everything: css / inlined images
      "--no-parent \\" + # don't go to parent level
      "--directory-prefix #{SiteConfig.get_local_location(name)} \\" + # download contents to repo folder
      "--no-host-directories \\" + # don't create domain named folder
      "#{SiteConfig.get_local_domain(name)}"
    Kernel.system(command)
    
    # Rename icons.eot? => icons.eot
    # Rename prism.js?v=e9dd6f695b => prism.js
    # Rename twitter_widgets.js?v=e9dd6f695b => twitter_widgets.js
    # Rename jquery.fitvids.js?v=e9dd6f695b => jquery.fitvids.js
    # Rename index.js?v=e9dd6f695b => index.js    
    Dir.glob(File.join(SiteConfig.get_local_location(name), "**", "*")).each { |f|
      if File.file?(f)
        if f =~ /.*?(\?.*)/
          new_name = f.sub(/\?.*/, '')
          puts "Renamed: #{f} => #{new_name}"
          File.rename(f, new_name)
        end
      end
    }
  end
  
  def self.preview(name)
    puts 'Local server started on http://localhost:9000'
    server = WEBrick::HTTPServer.new :Port => 9000, :DocumentRoot => SiteConfig.get_local_location(name)
    trap('INT') { server.stop }
    server.start
  end
  
  def self.deploy(name, commit_message)
    # NOTE: Repo does not checkout branch here. This is to avoid using stash. It switches branches *before* generating files to avoid it. 
    repo = Git::Base.init(SiteConfig.get_local_location(name))
    
    repo.add(:all => true)
    repo.commit(commit_message)
    repo.push(remote = 'origin', branch=repo.current_branch)
  end
  
  def self.get_list
    return SiteConfig.get_sites_list
  end
  
  def self.add(name, repo, dir, domain, local_url)
    SiteConfig.new_site(name, repo, dir, domain, local_url)
  end
  
  def self.remove(name)
    SiteConfig.remove(name)
  end
  
  def self.add_domain(domain_name, name)
    File.open(File.join(SiteConfig.get_local_location(name), 'CNAME'), 'w') {
      |f| f.write(domain_name)
    }
  end
end
