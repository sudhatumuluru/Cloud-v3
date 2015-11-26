class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.date :start_date
      t.text :description
      
      #t.datetime :created_at
      #t.datetime :cupdated_at

      t.timestamps null: false
    end
  end
end
