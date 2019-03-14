class RequestsController < ApplicationController
  before_action :logged_in_user, :load_book, only: :show

  def show
    @request = @book.requests.build
  end

  def create
    @request = Request.new request_params
    @request.price = @request.total
    if @request.save
      flash[:success] = t "controller.request.success"
      redirect_to current_user
    else
      flash[:danger] = t "controller.request.fail"
      redirect_to request_path @request.book
    end
  end

  private

  def request_params
    params.require(:request).permit :quantity, :from_date, :to_date,
      :book_id, :user_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "controller.book.load_fail"
    redirect_to books_path
  end
end
