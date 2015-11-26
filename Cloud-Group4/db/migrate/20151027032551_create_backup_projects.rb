class CreateBackupProjects < ActiveRecord::Migration
  def change
    create_table :backup_projects do |t|
      t.string :name
      t.string :status
      t.date :start_date
      t.string :description
      t.integer :client_id
      t.string :code

      t.timestamps null: false
    end
  end
end
