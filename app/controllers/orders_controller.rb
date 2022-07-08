class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update edit destroy]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new

    if @order.save
      redirect_to order_path, notice: 'Новый заказ создан!'
    else
      flash.now[:alert] = 'При попытке создать заказ возникли ошибки'

      render :new
    end
  end

  def update
    if @order.update
      redirect_to order_path, notice: 'Заказ обновлен!'
    else
      flash.now[:alert] = 'При попытке обновить заказ возникли ошибки'

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

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
