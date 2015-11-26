class AddColumnToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :tin_no, :string
  end
end
