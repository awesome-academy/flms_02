class AdminController < ApplicationController
  before_action :authenticate_user!, :authorized?

  private

  def authorized?
    return if current_user.admin?
    flash[:danger] = t "authorized"
    redirect_to current_user
  end
end
