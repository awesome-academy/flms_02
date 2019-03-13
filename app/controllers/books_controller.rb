class BooksController < ApplicationController
  before_action :load_book, only: :show

  def index
    @books = Book.newest.paginate page: params[:page],
      per_page: Settings.per_page.book
  end

  def show; end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "controller.book.load_fail"
    redirect_to books_path
  end
end
