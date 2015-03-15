class PatrolService

  def self.patrol_all(force = false)
    Site.find_each do |site|
      patrol(site, force)
    end
  end

  def self.patrol(site, force = false)
    Rails.logger.info("[#{site.url}] Patrol Start")

    unless force
      if HttpUtils.cached?(site.url)
        Rails.logger.info("[#{site.url}] Cached!")
        return false
      end
    end

    if site.results.count >= configatron.site_result_limit
      site.results.order('results.id ASC').first.destroy
    end

    site.results.create(response_body: HttpUtils.get(site.url, force))

    Rails.logger.info("[#{site.url}] Patrolled!")

    true
  end

end
