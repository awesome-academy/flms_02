class BooksController < ApplicationController
  before_action :load_book, :build_rating, :build_comment, :build_like, :build_request, only: :show

  def index
    @search = Book.ransack params[:q]
    @books = @search.result.newest.paginate page: params[:page],
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

  def build_request
    @request = @book.requests.new
  end

  def build_like
    @like = @book.likes.new
  end

  def build_comment
    @comment = @book.comments.new
  end

  def build_rating
    @rating = @book.ratings.new
  end
end
