class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update edit destroy]

  def new
    @order = Order.new
    @service_categories = ServiceCategory.all
    @services = Service.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      create_service_id
      create_executor_id

      redirect_to orders_path, notice: t('controllers.orders.created')
    else
      flash.now[:alert] = t('controllers.orders.not_created')

      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_path, notice: t('controllers.orders.updated')
    else
      flash.now[:alert] = t('controllers.orders.not_updated')

      render :edit  
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.order(created_at: :desc)
    @executors = Executor.order(created_at: :desc)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: t('controllers.orders.destroyed')
  end

  private

  def create_service_id
    params[:order][:service_ids].each { |id| @order.order_services.create(service_id: id) }
  end

  def create_executor_id
    params[:order][:executor_ids].each { |id| @order.order_services.create(executor_id: id) }
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, service_ids: [], executor_ids: [])
  end
end
