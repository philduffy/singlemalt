class MediaServer
  include Singleton

  SERVER_HOST = ENV['PLEX_SERVER_HOST']
  SERVER_PORT = ENV['PLEX_SERVER_PORT']
  SERVER_TOKEN = ENV['PLEX_SERVER_TOKEN']
  TVDB_TOKEN = ENV['TVDB_TOKEN']
  LIBRARY_SECTION = 6

  def initialize
    @plex = begin
      Plex::Server.new(SERVER_HOST, SERVER_PORT, SERVER_TOKEN)
    end

    @tvdb = begin
      Tvdbr::Client.new(ENV['TVDB_TOKEN'])
    end
  end

  def last_watched
    Rails.cache.fetch('last_watched', expires_in: 1.hour) do
      begin
        last_watched = @plex.library.section(LIBRARY_SECTION).recently_viewed.first.attribute_hash
        tvdb_id = find_tvdb_id(last_watched)

        last_watched.merge(find_external_urls(tvdb_id))
      rescue
        nil
      end
    end
  end

  private

  def find_external_urls(tvdb_id)
    tvdb_show = @tvdb.find_series_by_id(tvdb_id)

    {
      'imdb_url' => "http://www.imdb.com/title/#{tvdb_show.imdb_id}",
      'tvdb_artwork_url' => tvdb_show.poster,
      'tvdb_banner_url' => tvdb_show.banner
    }
  end

  def find_tvdb_id(attributes)
    attributes['guid'].split('/')[2]
  end
end
