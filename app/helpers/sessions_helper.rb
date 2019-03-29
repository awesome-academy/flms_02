module SessionsHelper

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

  def book_amount
    Book.all.size
  end

  def author_amount
    Author.all.size
  end

  def user_amount
    User.all.size
  end

  def processing_amount
    Request.not_approved.size
  end

  def select_role
    User.roles.keys.map {|role| [t("user_role.#{role}"), role]}
  end

  def rating? book
    current_user.ratings.find_by(book_id: book.id).present?
  end

  def your_rating book
    my_rating = current_user.ratings.find_by book_id: book.id
    my_rating.present? ? my_rating.number_rating : 0
  end
end
