class SterrenlinksController < ApplicationController

before_action :load_link_request

  def index
    @sterrenlinks = @link_request.sterrenlinks
  end

  def show
    # MEMO Ignore comments; they are here for educational use
    # @parent = Parent.find(params[:parent_id])
    # @child = @parent.children.find(params[:id])
    # @sterrenlink ||= @link_request.sterrenlinks.last
    @sterrenlink = @link_request.sterrenlinks.find(params[:id])
  end

  def create
    @sterrenlink ||= @link_request.sterrenlinks.build(sterrenlink_params)

    if @sterrenlink.save
      redirect_to [@link_request, @sterrenlink]
    end
  end

  def update
  end

  def destroy
  end

  def ready_to_send
    # @link_request = LinkRequest.find(params[:link_request_id])
    # @sterrenlink = @link_request.sterrenlinks.find(params[:id])
    @sterrenlink = @link_request.sterrenlinks.last
    @sterrenlink.process_email
    redirect_to [@link_request, @sterrenlink]
  end


  private

    def load_link_request
      @link_request ||= LinkRequest.find(params[:link_request_id])
    end

    def sterrenlink_params
      params.require(:sterrenlink).permit(:output_link)
    end

end
