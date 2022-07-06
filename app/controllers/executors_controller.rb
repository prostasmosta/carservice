class ExecutorsController < ApplicationController
  before_action :set_executor, only: %i[show update edit destroy]

  def new
    @executor = Executor.new
  end

  def create
    @executor = Executor.new(executor_params)

    if @executor.save
      redirect_to @executor, notice: 'Новый заказ создан!'
    else
      flash.now[:alert] = 'При попытке создать заказ возникли ошибки'

      render :new
    end
  end

  def update
    if @executor.save
      redirect_to @executor, notice: 'Заказ обновлен!'
    else
      flash.now[:alert] = 'При попытке обновить заказ возникли ошибки'

      render :edit
    end
  end

  def show
    @executor = Executor.find(params[:id])
  end

  def index
    @executors = Executor.order(created_at: :desc)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  private

  def set_executor
    @executor = Executor.find(params[:id])
  end

  def executor_params
    params.require(:executor).permit(:name)
  end
end
