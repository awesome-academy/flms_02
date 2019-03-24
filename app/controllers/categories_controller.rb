class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "controller.category.load_fail"
    redirect_to books_path
  end
end
