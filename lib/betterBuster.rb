class BetterBuster # TODO this needs to require buster.rb
  require_relative 'buster'
  
  def self.main(docopt_args)
    if docopt_args['setup']
      puts "This will delete everything in #{docopt_args['--dir']}. Are you sure you want to continue? (y/n)"
      go_on = STDIN.gets.strip
      if go_on != 'Y' && go_on != 'y'
        return
      end
      Buster.setup(docopt_args['--name'],
                   docopt_args['--repo'],
                   docopt_args['--dir'],
                   docopt_args['--local-url'],
                   docopt_args['--domain'],
                   docopt_args['--git-email'],
                   docopt_args['--git-name'])
      
    elsif docopt_args['generate']
      Buster.generate(get_docopt_arg(docopt_args, '--site')) 
      
    elsif docopt_args['preview']
      puts 'Serving at port 9000'
      Buster.preview(get_docopt_arg(docopt_args, '--site'))
      
    elsif docopt_args['deploy']
      puts 'Enter commit message:'
      commit_message = STDIN.gets
      Buster.deploy(get_docopt_arg(docopt_args, '--site'), commit_message)
      puts 'deployed'
      
    elsif docopt_args['list']
      sites_list = Buster.get_list
      if sites_list != ''
        puts sites_list
      end
      
    elsif docopt_args['add']
      Buster.add(docopt_args['--name'],
                 docopt_args['--repo'],
                 docopt_args['--dir'],
                 docopt_args['--domain'],
                 docopt_args['--local-url'])
      
    elsif docopt_args['remove']
      Buster.remove(get_docopt_arg(docopt_args, '--site'))
      
    elsif docopt_args['add-domain']
      Buster.add_domain(docopt_args['<domain-name>'], get_docopt_arg(docopt_args, '--site'))      
    else
      false
    end
    
    true
  end

  private 
  def self.get_docopt_arg(docopt_args, arg)
    return docopt_args[arg][0] # need to do to get the String from the Array.
  end
end
