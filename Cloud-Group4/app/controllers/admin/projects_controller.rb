class Admin::ProjectsController < ApplicationController
  before_filter :authenticate_user!


  
  def index
    @projects =current_user.is_admin? ? Project.all : current_user.projects
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to projects_path
    else 
      render action: "new"
    end
  end
  
  def show
    @project = current_user.projects.find(params[:id])
    @overdue_tasks = @project.tasks.where('is_completed= ? AND due_date < ?', false,Date.today)
    @incomplete_tasks = @project.tasks.where('is_completed= ? AND due_date >= ?', false,Date.today)
    @complete_tasks = @project.tasks.where('is_completed= ?', true)
  end
  
  def edit
    @project = current_user.projects.find(params[:id])  
  end
  
  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else 
      render action: "edit"
    end
  end
  
  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  
  private
  def project_params
    params[:project].permit(:name, :status, :start_date, :client_id, :description, :code)
  end
end
