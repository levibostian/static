require 'docopt'
DOC = <<DOCOPT
Ghost Buster. Static site generator for Ghost

Usage:
  buster setup (--name=<config-name>) (--repo=<repo-url>) (--dir=<path>) [--local-url=<url>] [--domain=<url>] [--git-email=<git-name>] [--git-name=<name>]
  buster add (--name=<config-name>) (--repo=<repo-url>) (--dir=<path>) [--local-url=<url>] [--domain=<url>]
  buster remove [--site=<config-name>]
  buster generate  [--site=<config-name>]
  buster preview [--site=<config-name>]
  buster deploy [--site=<config-name>]
  buster list
  buster add-domain <domain-name> [--site=<config-name>]
  buster (-h | --help)
  buster (-v | --version)
Options:
  -h --help          Show this screen.
  -v --version       Show betterBuster version.
  --name=<name>      Name to refer to site in sites-config.json and future --site calls.
  --site=<name>      sites-config.json site name. Use 'list' argument to see list.
  --dir=<path>       Absolute path of directory to store site.
  --local-url=<url>  Address of local ghost installation [default: 127.0.0.1:2368].
  --repo=<url>       GitHub repository. May use either https:// or git:// URL.
  --domain=<url>     Remote domain of site. [default: ""]

DOCOPT

docopt_args = {}

class BetterBusterMain
  def self.main
    begin
      require 'pp'
      require_relative 'betterBuster'
      require_relative 'version'
      docopt_args = Docopt::docopt(DOC, version: Version.get_version)
    rescue Docopt::Exit => e
      puts e.message
    end

    puts DOC unless BetterBuster.main(docopt_args)
  end
end
