class ServiceCategoriesController < ApplicationController
  before_action :set_cat, only: %i[show update edit destroy]

  def new
    @service_category = ServiceCategory.new
  end

  def create
    @service_category = ServiceCategory.new

    if @service_category.save
      redirect_to service_category_path, notice: 'Новый заказ создан!'
    else
      flash.now[:alert] = 'При попытке создать заказ возникли ошибки'

      render :new
    end
  end

  def update
    if @service_category.save
      redirect_to service_category_path, notice: 'Заказ обновлен!'
    else
      flash.now[:alert] = 'При попытке обновить заказ возникли ошибки'

      render :edit
    end
  end

  def show
    @service_category = ServiceCategory.find(params[:id])
  end

  def index
    @service_categories = ServiceCategory.order(created_at: :desc)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  private

  def set_cat
    @service_category = ServiceCategory.find(params[:id])
  end
end
