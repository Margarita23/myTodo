class ProjectController < ApplicationController
  load_and_authorize_resource :through => :current_user
  
  def index
    @task = Task.new
  end
  
  def create
    @project = Project.new(user_id: current_user.id)
    if @project.save
      flash[:notice] = "New project was successfully created"
    else
      flash[:alert] = "New project wasn't successfully created"
    end
    redirect_to root_path
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Project was successfully deleted"
    else
      flash[:alert] = "Project wasn't successfully deleted"
    end
    redirect_to root_path
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(projects_params)
      flash[:notice] = "Project was successfully updated"
    else
      flash[:alert] = "Project wasn't successfully updated"
    end
    redirect_to root_path
  end
  
  def set_priority
    @project = Project.find(params[:project_id])
    @ids = params[:ids]
    @count = params[:ids].count
    @count.times do |index|
      @task = @project.tasks.find(@ids[index])
      @task.update(priority: index.to_i)
    end
  end
  
  private

  def tasks_params
    params.require(:task).permit(:target)
  end
  
  def projects_params
    params.require(:project).permit(:name)
  end
  
end
