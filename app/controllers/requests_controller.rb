class RequestsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @request = current_user.requests.build request_params
    @request.price = @request.total
    if @request.save
      flash[:success] = t "controller.request.success"
    else
      flash[:danger] = t "controller.request.fail"
    end
    redirect_to current_user
  end

  private

  def request_params
    params.require(:request).permit :quantity, :from_date, :to_date, :book_id
  end
end
