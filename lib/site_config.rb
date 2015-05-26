class SiteConfig
  require 'json'
  require 'fileutils'

  CONFIG_DIR = File.expand_path('~/.config/static/')
  CONFIG_FILENAME = 'sites_config.json'
  CONFIG_FILE = File.join(CONFIG_DIR, CONFIG_FILENAME)

  def self.new_site(name, repo_url, dir, domain, local_url)
    check_config_exists
    sites = get_sites_json
    sites[name] = {:local => {:location => dir, :domain => local_url},
                   :remote => {:domain => domain, :gh_repo => repo_url}}

    save_config(sites)
  end

  def self.get_local_location(name)
    check_config_exists
    sites = get_sites_json
    return sites[name]['local']['location']
  end

  def self.get_repo_url(name)
    check_config_exists
    sites = get_sites_json
    return sites[name]['remote']['gh_repo']
  end

  def self.get_sites_list
    check_config_exists
    return get_sites_json.keys
  end

  def self.get_local_domain(name)
    check_config_exists
    sites = get_sites_json
    return sites[name]['local']['domain']
  end

  def self.remove(name)
    check_config_exists
    sites = get_sites_json
    sites.delete(name)
    save_config(sites)
  end

  private
  def self.save_config(sites)
    File.open(CONFIG_FILE, 'w') { |f| f.write(JSON.pretty_generate(sites))}
  end

  private
  def self.check_config_exists
    unless File.exist?(CONFIG_FILE)
      FileUtils.mkpath(CONFIG_DIR)
      File.open(CONFIG_FILE, 'w') { |f| f.write('{}') }
    end
  end

  private
  def self.get_sites_json
    return JSON.parse(File.open(CONFIG_FILE).read)
  end
end
