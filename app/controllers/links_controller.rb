class LinksController < ApplicationController
  before_action :set_link, only: :show

  # GET /links
  # GET /links.json
  def index
    @links = current_user.links
  end

  # GET /links/1
  # GET /links/1.json
  def show; end

  # GET /links/new
  def new
    @link = current_user.links.new
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to user_link_path(current_user.id, @link), notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = current_user.links.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def link_params
    params.require(:link).permit(:long_url, :delete_at, :seconds)
  end
end
