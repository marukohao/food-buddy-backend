class AddNewHostIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :new_host_id, :integer
  end
end
