class ServiceCategoriesController < ApplicationController
  before_action :set_cat, only: %i[show update edit destroy]

  def new
    @service_category = ServiceCategory.new
  end

  def create
    @service_category = ServiceCategory.new(cat_params)

    if @service_category.save
      redirect_to @service_category, notice: 'Новая категория создана!'
    else
      flash.now[:alert] = 'При попытке создать категорию возникли ошибки'

      render :new
    end
  end

  def update
    if @service_category.update(cat_params)
      redirect_to @service_category, notice: 'Категория обновлена!'
    else
      flash.now[:alert] = 'При попытке обновить категорию возникли ошибки'

      render :edit
    end
  end

  def show
    @services = @service_category.services.order(created_at: :desc)
  end

  def index
    @service_categories = ServiceCategory.order(created_at: :desc)
  end

  def destroy
    @service_category.destroy

    redirect_to service_categories_path, notice: 'Категория удалена!'
  end

  private

  def set_cat
    @service_category = ServiceCategory.find(params[:id])
  end

  def cat_params
    params.require(:service_category).permit(:title)
  end
end
