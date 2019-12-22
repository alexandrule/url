class DeleteLinksWorker
  include Sidekiq::Worker

  def perform(link_ids)
    Link.where(id: link_ids).delete_all
  end
end
