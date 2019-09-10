class AddCancelledToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :cancelled, :boolean
  end
end
