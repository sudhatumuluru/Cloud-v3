class Task < ActiveRecord::Base
  belongs_to :project
  has_many :task_users
  has_many :users, through: :task_users
  
  validates_presence_of :name, :project_id
  validate :check_due_date
  
  mount_uploader :project_apk, ProjectApkUploader
  
  private
  def check_due_date
    if (!project_id.nil?)
      project = Project.find(project_id)
      if due_date < project.start_date
        errors.add(:due_date , "is invalid date, should be greater than #{project.start_date}")
      end
    end
  end
  
  
end
