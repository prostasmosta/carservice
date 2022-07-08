class ExecutorsController < ApplicationController
  before_action :set_executor, only: %i[show update edit destroy]

  def new
    @executor = Executor.new
  end

  def create
    @executor = Executor.new(executor_params)

    if @executor.save
      redirect_to @executor, notice: 'Новый исполнитель добавлен!'
    else
      flash.now[:alert] = 'При попытке добавить исполнителя возникли ошибки'

      render :new
    end
  end

  def update
    if @executor.update(executor_params)
      redirect_to @executor, notice: 'Данные исполнителя обновлены!'
    else
      flash.now[:alert] = 'При попытке обновить данные исполнителя возникли ошибки'

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
    @executor.destroy

    redirect_to executors_path, notice: 'Исполнитель удален!'
  end

  private

  def set_executor
    @executor = Executor.find(params[:id])
  end

  def executor_params
    params.require(:executor).permit(:name)
  end
end
