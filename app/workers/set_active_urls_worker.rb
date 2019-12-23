class SetActiveUrlsWorker
  include Sidekiq::Worker

  def perform(url_ids)
    Link.where(id: url_ids).update_all(active: true)
  end
end
