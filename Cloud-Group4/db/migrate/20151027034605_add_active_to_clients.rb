class AddActiveToClients < ActiveRecord::Migration
  def change
    add_column :clients, :active, :boolean, default: false
  end
end
