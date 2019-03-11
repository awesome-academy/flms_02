class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.alphabet.paginate page: params[:page],
      per_page: Settings.per_page.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controller.category.create.success"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "controller.category.create.failed"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "controller.category.update.success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "controller.category.destroy.success"
    else
      flash[:danger] = t "controller.category.destroy.failed"
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    redirect_to admin_categories_path
  end
end
