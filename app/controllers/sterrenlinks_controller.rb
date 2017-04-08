class SterrenlinksController < ApplicationController


  def show
    @sterrenlink = Sterrenlink.find(params[:id])
  end

  def create
    @link_request = LinkRequest.find(params[:link_request_id])
    @sterrenlink = @link_request.sterrenlinks.create(sterrenlink_params)

    if @sterrenlink.save
      # redirect_to @link_request
      # redirect_to @sterrenlink
      redirect_to [@link_request, @sterrenlink]
    end
  end

  def update
  end

  def destroy
  end

  private

    def sterrenlink_params
      params.require(:sterrenlink).permit(:output_link)
    end

end
