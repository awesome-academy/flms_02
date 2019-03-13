class Admin::BooksController < AdminController
  before_action :load_book, only: %i(edit show update destroy)

  def index
    @books = Book.newest.paginate page: params[:page],
      per_page: Settings.per_page.books
  end

  def new
    @book = Book.new
    @book.author_books.build
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "controller.book.create.success"
      redirect_to admin_books_path
    else
      flash[:danger] = t "controller.book.create.failed"
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "controller.book.update.success"
      redirect_to admin_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "controller.book.destroy.success"
    else
      flash[:danger] = t "controller.book.destroy.failed"
    end
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit :category_id, :publisher_id, :name,
      :content, :num_of_pages, :year, :quantity, :price, :image,
      author_books_attributes: [:id, :author_id, :book_id]
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "controller.book.load_fail"
    redirect_to admin_books_path
  end
end
