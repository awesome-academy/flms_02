class Admin::AuthorsController < AdminController
  before_action :load_author, only: %i(edit update destroy)

  def index
    @authors = Author.alphabet.paginate page: params[:page],
      per_page: Settings.per_page.authors
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t "controller.author.create.success"
      redirect_to admin_authors_path
    else
      flash[:danger] = t "controller.author.create.failed"
      render :new
    end
  end

  def edit; end

  def update
    if @author.update_attributes author_params
      flash[:success] = t "controller.author.update.success"
      redirect_to admin_authors_path
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t "controller.author.destroy.success"
    else
      flash[:danger] = t "controller.author.destroy.failed"
    end
    redirect_to admin_authors_path
  end

  private

  def author_params
    params.require(:author).permit :name, :phone, :address
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:danger] = t "controller.author.load_fail"
    redirect_to admin_authors_path
  end
end
