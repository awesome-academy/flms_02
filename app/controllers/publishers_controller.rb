class PublishersController < ApplicationController
  def show
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:danger] = t "controller.publisher.load_fail"
    redirect_to books_path
  end
end
