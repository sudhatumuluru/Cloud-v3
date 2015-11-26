class Category < ActiveRecord::Base
  has_many :project_categories
  has_many :projects, through: :project_categories
  belongs_to :user
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
