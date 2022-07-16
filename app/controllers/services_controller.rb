class ServicesController < ApplicationController
  before_action :set_cat
  before_action :set_service, only: %i[show update edit destroy]

  def new
    @service = @service_category.services.build
  end

  def create
    @service = @service_category.services.build(service_params)

    if @service.save
      redirect_to service_category_path(@service_category), notice: t('controllers.services.created')
    else
      flash.now[:alert] = t('controllers.services.not_created')

      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to @service_category, notice: t('controllers.services.updated')
    else
      flash.now[:alert] = t('controllers.services.not_updated')

      render :edit
    end
  end

  def edit
  end

  def show
  end

  def index
    @services = @service_category.services.order(created_at: :desc)
  end

  def destroy
    @service.destroy

    redirect_to @service_category, notice: t('controllers.services.destroyed')
  end

  private

  def set_cat
    @service_category = ServiceCategory.find(params[:service_category_id])
  end

  def set_service
    @service = @service_category.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :price, :exec_time, :service_category_id)
  end
end
