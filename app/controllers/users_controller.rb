class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controller.user.create.success"
      redirect_to root_path
    else
      flash[:danger] = t "controller.user.create.failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :address,
      :password, :password_confirmation, :role
  end
end
