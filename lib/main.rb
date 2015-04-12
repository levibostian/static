require 'docopt'
doc = <<DOCOPT
*static*
Static website generator to push dynamic website to GitHub pages for static hosting.

Usage:
  static setup (--name=<config-name>) (--repo=<repo-url>) (--dir=<path>) (--local-url=<url>) [--domain=<url>] [--git-email=<git-name>] [--git-name=<name>]
  static add (--name=<config-name>) (--repo=<repo-url>) (--dir=<path>) (--local-url=<url>) [--domain=<url>]
  static remove (--site=<config-name>)
  static generate (--site=<config-name>)
  static preview (--site=<config-name>)
  static deploy (--site=<config-name>)
  static list
  static add-domain <domain-name> (--site=<config-name>)
  static (-h | --help)
  static (-v | --version)
Options:
  -h --help          Show this screen.
  -v --version       Show static program version.
  --name=<name>      Name to refer to site in sites-config.json and future --site calls.
  --site=<name>      Name to associate with website. Use 'list' argument to see list of all setup sites.
  --dir=<path>       Absolute path of directory to store generated website files.
  --local-url=<url>  Local web address for website.
  --repo=<url>       GitHub repository. May use either https:// or git:// URL.
  --domain=<url>     Remote domain name of site.

DOCOPT

docopt_args = {}

begin
  require 'pp'
  require_relative 'delegator'
  require_relative 'version'
  docopt_args = Docopt::docopt(doc, version: Version.get_version)
rescue Docopt::Exit => e
  puts e.message
end

puts doc unless StaticDelegator.main(docopt_args)
