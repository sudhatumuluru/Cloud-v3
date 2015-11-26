class AddTestResultToReports < ActiveRecord::Migration
  def change
  	add_column :reports, :test_result, :string
  end
end
