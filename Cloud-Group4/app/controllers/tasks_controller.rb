class TasksController < ApplicationController
	skip_before_filter :verify_authenticity_token  

	def mark_as_incomplete
		@task = Task.find(params[:task_id])
		@project = @task.project
		@task.update_attributes(is_completed: false)
		@incomplete_tasks = @project.tasks.where('is_completed= ? AND due_date >= ?', false,Date.today)
    	@complete_tasks = @project.tasks.where('is_completed= ?', true)
    	
	end

	def mark_as_complete
		@task = Task.find(params[:task_id])
		@project = @task.project
		@task.update_attributes(is_completed: true)
		@incomplete_tasks = @project.tasks.where('is_completed= ? AND due_date >= ?', false,Date.today)
    	@complete_tasks = @project.tasks.where('is_completed= ?', true)
    	
	end
	def index
		@tasks = current_user.tasks.all
		respond_to do |format|
      format.html
      format.xls
  end
	end
	def new
		@project = current_user.projects.find(params[:project_id])
		@task = Task.new

	end
	
	def edit
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
	end
	def show
		@task = current_user.tasks.find(params[:id])
		@project = @task.project
	end

	def create
		@task = Task.new(task_params)
		@task.save
		@project = Project.find(params[:project_id])
		@task.project_id = @project.id
@rem_users = User.where('id != ?', current_user.id)
#	@rem_users = User.all :conditions => (current_user ? ["id != ?", current_user.id] : [])
 		@task.users = @rem_users.shuffle.first(3)
	#	@task.users = User.all.shuffle.first(3)
		@overdue_tasks = @project.tasks.where('is_completed= ? AND due_date < ?', false,Date.today)
    	@incomplete_tasks = @project.tasks.where('is_completed= ? AND due_date >= ?', false,Date.today)
    	@complete_tasks = @project.tasks.where('is_completed= ?', true)
    	if (!@task.is_completed && @task.due_date < Date.today)
			@overdue_task = @task
		elsif (!@task.is_completed && @task.due_date >= Date.today)
			@incomplete_task = @task
    	else
    		@complete_task = @task
    	end
    	redirect_to project_path(@project)
	end

	def update
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.update_attributes(task_params)
	end

	def destroy
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.delete
		redirect_to project_path(@project), notice: "Task deleted"
	end


	private
	def task_params
		params[:task].permit(:name, :project_id, :due_date, :is_completed, :project_apk)
	end
end
