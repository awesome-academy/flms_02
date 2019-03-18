module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    return unless (user_id = session[:user_id])
    @current_user ||= User.find_by id: user_id
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def current_user? user
    user == current_user
  end

  def requests_newest
    current_user.requests.newest
  end

  def like? book
    current_user.likes.find_by(book_id: book.id).present?
  end

  def comment_of_user? comment
    current_user.comments.find_by(id: comment.id).present?
  end
end
