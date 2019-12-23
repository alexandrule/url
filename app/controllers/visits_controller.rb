class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  def index
    visits = current_user.links.find(params[:link_id]).visits
    @visits = visits.group("date(created_at)").count
  end
end
