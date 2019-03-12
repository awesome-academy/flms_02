class UsersController < ApplicationController
  before_action :load_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controller.user.create.success"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = t "controller.user.create.failed"
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :address,
      :password, :password_confirmation, :role
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "controller.user.load_fail"
    redirect_to login_path
  end
end
