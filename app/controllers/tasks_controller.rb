class TasksController < ApplicationController

  def index
    @tasks = Task.order(:name)
  end

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create

    @task = Task.new(allowed_parameters)
    @task_list = TaskList.find(params[:task_list_id])
    @task.task_list = @task_list

    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to "/"
  end


  private
  def allowed_parameters
    params.require(:task).permit(:task, :due_date, :task_list_id)
  end


end


