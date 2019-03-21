class Admin::RequestsController < AdminController
  before_action :load_request, only: :update

  def index
    if params[:request] && params[:request][:status]
      @requests = Request.by_status params[:request][:status]
    else
      @requests = Request.all
    end
    @requests = @requests.newest.paginate page: params[:page],
      per_page: Settings.per_page.requests
  end

  def update
    if @request.update_attributes request_params
      RequestMailer.request_email(@request).deliver_later
      flash[:success] = t "controller.request.update.success"
      redirect_to admin_requests_path
    else
      render :index
    end
  end

  private

  def request_params
    params.require(:request).permit :status
  end

  def load_request
    @request = Request.find_by id: params[:id]
    return if @request
    flash[:danger] = t "controller.request.load_fail"
    redirect_to admin_requests_path
  end
end
