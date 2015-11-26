class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :permissions
  has_many :roles, through: :permissions
  has_one :profile
  has_many :projects
  has_many :clients
  has_many :categories
  has_many :vendors
  has_many :task_users
  has_many :tasks, through: :task_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reports



  def role?(role)
    self.roles.pluck(:name).include? (role)
  end

  def is_admin?
  	((role? "super_admin") || (role? "admin")) ? true :false
  end

end
