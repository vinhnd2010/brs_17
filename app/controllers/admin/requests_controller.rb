class Admin::RequestsController < ApplicationController
  def index
    @requests = Request.paginate page: params[:page]
  end

  def update
    @request = Request.find params[:id]
    if @request.update_attributes request_params
      respond_to do |format|
        format.html {redirect_to admin_requests_path}
        format.js
      end
    else
      flash[:info] = t "flash.request.unupdate"
      redirect_to request.referer
    end
  end

  private
  def request_params
    params.require(:request).permit :status
  end
end
