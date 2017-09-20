class TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :task, :through => :project
  
  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:notice] = "New task was successfully created"
    else
      flash[:alert] = "New task wasn't successfully create" 
    end
    redirect_to root_path
  end
  
  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task was deleted"
    else
      flash[:alert] = "Task was not deleted"
    end
    redirect_to root_path
  end
  
  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "New task was successfully updated"
    else
      flash[:alert] = "New task wasn't successfully updated"
    end
    redirect_to root_path
  end
  
  private

  def task_params
    params.require(:task).permit(:target)
  end
  
end
