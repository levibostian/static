class Buster
  def self.setup(name, repo, dir, local_url, domain, git_email, git_name)
    puts 'setup'
  
  end
  
  def self.generate
    puts 'generate'
  end

  def self.preview
    puts 'preview'
  end

  def self.deploy
    puts 'deploy'
  end

  def self.get_list
    puts 'get_list'
    'the list'
  end

  def self.add(name, repo, dir, domain, local_url)
    puts 'add'
  end

  def self.remove
    puts 'remove'
  end

  def self.add_domain(domain_name)
    puts 'add_domain'
  end
end
