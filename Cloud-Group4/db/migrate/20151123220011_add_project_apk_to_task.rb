class AddProjectApkToTask < ActiveRecord::Migration
  def change
	add_column :tasks, :project_apk, :string 
 end
end
