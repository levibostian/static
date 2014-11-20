class BetterBuster # TODO this needs to require buster.rb
  require_relative 'buster'

  def self.main(docopt_args)
    if docopt_args['setup']
      # TODO wrap this call around a try/except
      Buster.setup(docopt_args['--name'],
                   docopt_args['--repo'],
                   docopt_args['--dir'],
                   docopt_args['--local-url'],
                   docopt_args['--domain'],
                   docopt_args['--git-email'],
                   docopt_args['--git-name'])

    elsif docopt_args['generate']
      Buster.generate

    elsif docopt_args['preview']
      puts 'Serving at port 9000'
      Buster.preview

    elsif docopt_args['deploy']
      Buster.deploy
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
        Buster.remove

    elsif docopt_args['add-domain']
        Buster.add_domain(arguments['<domain-name>'])
        
    else
        false
    end

    true
  end
end
