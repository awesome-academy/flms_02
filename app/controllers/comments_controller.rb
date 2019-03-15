class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_comment, only: :destroy

  def create
    @comment = current_user.comments.build comments_params
    if @comment.save
      flash[:success] = t "controller.comment.create.success"
    else
      flash[:danger] = t "controller.comment.create.failed"
    end
    redirect_to @comment.book
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "controller.comment.destroy.success"
    else
      flash[:danger] = t "controller.comment.destroy.failed"
    end
    redirect_to @comment.book
  end

  private

  def comments_params
    params.require(:comment).permit :book_id, :content
  end

  def load_comment
    @comment = current_user.comments.find_by id: params[:comment_id]
    return if @comment
    flash[:danger] = t "controller.comment.load_fail"
    redirect_to root_path
  end
end
