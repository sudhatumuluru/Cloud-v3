class Project < ActiveRecord::Base
  has_many :project_categories
  has_many :categories, through: :project_categories
  has_many :tasks
  belongs_to :client
  belongs_to :user
  
  before_create :set_project_code
  before_destroy :delete_tasks
  after_destroy :backup_project
  
  validates_presence_of :name, :start_date, :status, :client_id
  validates_numericality_of :client_id
  validates_length_of :name, within: 3..15 # is: 10
  def details
    "#{name} - #{status} - #{description} -#{start_date} - #{Client.find(self.client_id).name}"
  end

  def self.by_range(start_range, end_range)
  Project.where('start_date >= ? AND start_date <= ?', start_range, end_range)
  end
  
  private
  def set_project_code
    self.code = "#{self.name.slice(2..5)}-#{Random.rand(30..100)}"
  end
  
  def delete_tasks
    Task.where(project_id: self.id).delete_all
  end
  
  def backup_project
    # BackupProject.create(self.dup)
    backup_project = BackupProject.new
    backup_project.name = self.name
    backup_project.status = self.status
    backup_project.description = self.description
    backup_project.start_date = self.start_date
    backup_project.code = self.code
    backup_project.client_id = self.client_id
    backup_project.save
  end
  
end