class ServicesController < ApplicationController
  before_action :set_service, only: %i[show update edit destroy]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to service_path, notice: 'Новый заказ создан!'
    else
      flash.now[:alert] = 'При попытке создать заказ возникли ошибки'

      render :new
    end
  end

  def update
    if @service.save
      redirect_to service_path, notice: 'Заказ обновлен!'
    else
      flash.now[:alert] = 'При попытке обновить заказ возникли ошибки'

      render :edit
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def index
    @services = Service.order(created_at: :desc)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title)
  end
end
