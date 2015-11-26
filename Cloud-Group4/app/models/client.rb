class Client < ActiveRecord::Base
  has_many :projects
  belongs_to :user
  
  validates_presence_of :name, :company, :email
  validates_uniqueness_of :email, :company
  validates_format_of :email , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  before_destroy :delete_projects
  scope :active, -> {where('active = ?', true)}
  scope :inactive, -> {where('active = ?', false)}
  
  def list_projects
    Project.where('client_id = ?', self.id)
  end
  
  private
  
  def delete_projects
    projects = Project.where(client_id: self.id)
    projects.each do |project|
    project.destroy  
    end
  end
  
end
