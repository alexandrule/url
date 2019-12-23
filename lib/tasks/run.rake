namespace :run do
  task delete_expired_urls: :environment do
    time_now = Time.now.utc
    link_ids = Link.where('delete_at < ?', time_now).ids
    DeleteLinksWorker.perform_async(link_ids)
  end

  task set_active_urls: :environment do
    time_now = Time.now.utc
    url_ids = Link.where('available_at < ?', time_now).ids
    SetActiveUrlsWorker.perform_async(url_ids)
  end
end
