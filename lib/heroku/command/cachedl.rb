class Heroku::Command::Repo < Heroku::Command::BaseWithApp
  def download_cache
  end

  def cache_delete_url
    release['cache_delete_url']
  end

  private
  def release
    @release ||= api.request(
      :method  => "get",
      :expects => 200,
      :path    => "/apps/#{app}/releases/new",
      :headers => {
        "Accept" => "application/vnd.heroku+json; version=2",
      }
    ).body
  end
end
