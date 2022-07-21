class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update edit destroy]
  helper_method :sort_column, :sort_direction

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
    @orders = Order.
      joins(:services, :executors).
      group('orders.id').
      order(sort_column + " " + sort_direction).
      paginate(page: params[:page], per_page: 8)

    @orders = @orders.find_by_customer_name(params[:customer_name]) if params[:customer_name].present?
    @orders = @orders.find_by_service_title(params[:title]) if params[:title].present?
    @orders = @orders.find_by_executor_name(params[:name]) if params[:name].present?

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_path, notice: t('controllers.orders.destroyed')
  end

  private

  def sort_column
    col_names = Order.column_names + Service.column_names + Executor.column_names
    col_names.include?(params[:sort]) ? params[:sort] : "customer_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

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
