class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      flash[:success] = t "controller.session.login_success"
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t "controller.session.login_fail"
      render :new
    end
  end
end
