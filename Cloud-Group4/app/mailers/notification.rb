class Notification < ApplicationMailer

  def notify_complete(task)
    @task = task
    mail to: "#{@task.project.client.email}" , cc: "#{@task.project.user.email}"
  end

  def notify_incomplete(task)
    @task = task
    mail to: "#{@task.project.client.email}"
  end
end
