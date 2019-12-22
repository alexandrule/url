namespace :run do
  task delete_expired_urls: :environment do
    time_now = Time.now.utc
    link_ids = Link.where('delete_at < ?', time_now).ids
    DeleteLinksWorker.perform_async(link_ids)
  end
end
