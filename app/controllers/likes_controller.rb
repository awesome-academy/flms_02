class LikesController < ApplicationController
  before_action :load_like, only: :destroy

  def create
    @like = current_user.likes.build likes_params
    if @like.save
      flash[:success] = t "controller.like.create.success"
    else
      flash[:danger] = t "controller.like.create.failed"
    end
    redirect_to @like.book
  end

  def destroy
    if @like.destroy
      flash[:success] = t "controller.like.destroy.success"
    else
      flash[:danger] = t "controller.like.destroy.failed"
    end
    redirect_to @like.book
  end

  private

  def likes_params
    params.require(:like).permit :book_id
  end

  def load_like
    @like = current_user.likes.find_by book_id: params[:book_id]
    return if @like
    flash[:danger] = t "controller.like.load_fail"
    redirect_to root_path
  end
end
