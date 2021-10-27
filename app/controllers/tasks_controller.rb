class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
   # @task = Task.find params[:id]
  end

  def new
    #@task = Task.new
    @task = current_user.tasks.build
  end

  def create
    #@task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def task_completed
    @task.toggle! :completed
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    redirect_to tasks_path, notice: "Not Authorized to Edit!" if @task.nil?
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :user_id, :completed)
  end
end
