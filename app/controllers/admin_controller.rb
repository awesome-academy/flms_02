class AdminController < ApplicationController
  before_action :logged_in_user, :authorized?
  before_action :authorized?

  private

  def authorized?
    return if current_user.admin?
    flash[:danger] = t "authorized"
    redirect_to current_user
  end
end
