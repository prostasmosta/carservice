class ServicesController < ApplicationController
  before_action :set_cat, except: %i[]
  before_action :set_service, only: %i[new show update edit destroy]

  def new
    # @service = @service_category.services.build
    @service = Service.new
    @service.service_category_id = params[:service_category_id]
  end

  def create
    @service = @service_category.services.build(service_params)

    if @service.save
      redirect_to @service_category, notice: 'Новая услуга добавлена!'
    else
      flash.now[:alert] = 'При попытке добавить услугу возникли ошибки'

      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to @service_category, notice: 'Услуга обновлена!'
    else
      flash.now[:alert] = 'При попытке обновить услугу возникли ошибки'

      render :edit
    end
  end

  def edit
  end

  def show
  end

  def index
    # @service_category = ServiceCategory.find(params[:service_category_id])
    @services = @service_category.services.order(created_at: :desc)
  end

  def destroy
    @service.destroy

    redirect_to @service_category, notice: 'Услуга удалена!'
  end

  private

  def set_cat
    @service_category = ServiceCategory.find(params[:id])
  end

  def set_service
    @service = @service_category.services.find(params[:service_category_id])
  end

  def service_params
    params.require(:service).permit(:title, :service_category_id)
  end
end
