require 'open-uri'

class HttpUtils

  def self.cached?(url)
    !!Rails.cache.read(url_hash(url))
  end

  def self.get(_url, force = false)
    url = _url.strip

    Rails.cache.delete(url_hash(url)) if force

    Rails.cache.fetch(url_hash(url), expires_in: configatron.site_cache_expires_in) do
      ret = open(url).read
      sleep(1)
      ret
    end
  end

  def self.url_hash(url)
    "html_caches.#{Digest::MD5.hexdigest(url)}"
  end
end
