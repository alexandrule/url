class VisitsController < ApplicationController
  before_action :set_visits

  # GET /visits
  # GET /visits.json
  def index
    @visits = @visits.group("date(created_at)").count
  end

  # GET /browsers
  # GET /browsers.json
  def browsers
    @visits = @visits.group(:browser_name).count
  end

  # GET /devices
  # GET /devices.json
  def devices
    @visits = @visits.group(:device_name).count
  end

  private

  def set_visits
    @visits = current_user.links.find(params[:link_id]).visits
  end
end
