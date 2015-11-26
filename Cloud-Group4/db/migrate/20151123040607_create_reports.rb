class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :user_id
      t.integer :bug_count

      t.timestamps null: false
    end
  end
end
