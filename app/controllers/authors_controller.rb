class AuthorsController < ApplicationController
  def show
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:danger] = t "controller.author.load_fail"
    redirect_to books_path
  end
end
