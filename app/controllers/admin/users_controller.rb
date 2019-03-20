class Admin::UsersController < AdminController
  before_action :load_user, only: %i(edit update destroy)

  def index
    if params[:user] && params[:user][:role]
      @users = User.by_role params[:user][:role]
    else
      @users = User.all
    end
    @users = @users.alphabet.paginate page: params[:page],
      per_page: Settings.per_page.users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "controller.user.create.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "controller.user.create.failed"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controller.user.update.success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controller.user.destroy.success"
    else
      flash[:danger] = t "controller.user.destroy.failed"
    end
    redirect_to admin_users_path
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
    redirect_to admin_users_path
  end
end
