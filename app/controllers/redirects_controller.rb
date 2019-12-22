class RedirectsController < ApplicationController
  def go
    link = current_user.links.active.find_by(short_url: params[:slug])
    if link
      redirect_to link.long_url
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
end
