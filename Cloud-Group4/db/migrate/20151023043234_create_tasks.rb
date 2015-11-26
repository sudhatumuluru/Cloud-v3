class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.integer :project_id
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
