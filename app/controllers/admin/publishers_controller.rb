class Admin::PublishersController < AdminController
  before_action :load_publisher, only: %i(edit update destroy)

  def index
    @publishers = Publisher.alphabet.paginate page: params[:page],
      per_page: Settings.per_page.publishers
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:success] = t "controller.publisher.create.success"
      redirect_to admin_publishers_path
    else
      flash[:danger] = t "controller.publisher.create.failed"
      render :new
    end
  end

  def edit; end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t "controller.publisher.update.success"
      redirect_to admin_publishers_path
    else
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = t "controller.publisher.destroy.success"
    else
      flash[:danger] = t "controller.publisher.destroy.failed"
    end
    redirect_to admin_publishers_path
  end

  private

  def publisher_params
    params.require(:publisher).permit :name, :phone, :address
  end

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:danger] = t "controller.publisher.load_fail"
    redirect_to admin_publishers_path
  end
end
