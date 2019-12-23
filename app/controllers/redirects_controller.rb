class RedirectsController < ApplicationController
  skip_before_action :require_login
  before_action :set_link

  def go
    if @link
      create_visit
      redirect_to @link.long_url
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  private

  def set_link
    @link = Link.active.find_by(short_url: params[:slug])
  end

  def create_visit
    browser = Browser.new(request.env['HTTP_USER_AGENT'])
    @link.visits.create(browser_name: browser.name, device_name: browser.platform.name)
  end
end
