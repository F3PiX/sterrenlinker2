class LinkRequestsController < ApplicationController
  before_action :set_link_request, only: [:show, :edit, :update, :destroy]

  # GET /link_requests
  # GET /link_requests.json
  def index
    @link_requests = LinkRequest.all.reverse_order
  end

  # GET /link_requests/1
  # GET /link_requests/1.json
  def show
    @sterrenlink ||= @link_request.sterrenlinks.last
  end

  # GET /link_requests/new
  def new
    @link_request = LinkRequest.new
  end

  # GET /link_requests/1/edit
  def edit
  end

  # POST /link_requests
  # POST /link_requests.json
  def create
    @link_request = LinkRequest.new(link_request_params)

    respond_to do |format|
      if @link_request.save
        @link_request.sterrenlinks.create!
        format.html { redirect_to @link_request, notice: 'Link request was successfully created.' }
        format.json { render :show, status: :created, location: @link_request }
      else
        format.html { render :new }
        format.json { render json: @link_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @link_request.update(link_request_params)
        @link_request.sterrenlinks.last.save
        format.html { redirect_to @link_request, notice: 'Link request was successfully updated.' }
        format.json { render :show, status: :ok, location: @link_request }
      else
        format.html { render :edit }
        format.json { render json: @link_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_requests/1
  # DELETE /link_requests/1.json
  def destroy
    @link_request.destroy
    respond_to do |format|
      format.html { redirect_to link_requests_url, notice: 'Link request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_request
      @link_request = LinkRequest.find(params[:id])
    end

    def link_request_params
      params.require(:link_request)
            .permit(
                :researcher, :research_org, :researcher_email, :research_proposal,
                :patient_org,
                :fonds,
                :application_date,
                :sterrenlink_sent_at,
            )
    end
end
