class RatingsController < ApplicationController
  before_action :authenticate_user!, :update_rating, only: :create

  def create
    @rating = current_user.ratings.build ratings_params
    if @rating.save
      flash[:success] = t "controller.rating.create.success"
      @rating.book.update_avg_rating
    else
      flash[:danger] = t "controller.rating.create.failed"
    end
    redirect_to @rating.book
  end

  private

  def ratings_params
    params.require(:rating).permit :book_id, :number_rating
  end

  def update_rating
    @rating = current_user.ratings.find_by book_id: ratings_params[:book_id]
    return unless @rating
    @rating.update_attributes ratings_params
    @rating.book.update_avg_rating
    flash[:success] = t "controller.rating.update.success"
    redirect_to @rating.book
  end
end
