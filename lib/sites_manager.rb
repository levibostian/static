class SitesManager
  def initialize()
    @github_repo_url = ''
    @local_location = ''
    @local_domain = ''
    @remote_domain = ''
    @json_dictionary = {}
    @site_name = ''
  end

  def get_site
    @site_name
  end
end
