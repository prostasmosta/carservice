class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update edit destroy]

  def new
    @order = Order.new
    @service_categories = ServiceCategory.all
  end

  def create
    @order = Order.new

    if @order.save
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

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    # params.require(:order).params(:number)
  end
end
