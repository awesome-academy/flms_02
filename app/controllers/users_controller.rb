class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :correct_user, only: %i(show edit update)
  before_action :logged_in_user, only: %i(show edit update)

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

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controller.user.update.success"
      redirect_to @user
    else
      render :edit
    end
  end

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

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user?(@user)
    flash[:danger] = t "controller.user.incorrect"
    redirect_to current_user
  end
end
