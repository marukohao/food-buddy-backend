class AddTimeToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :time, :string
  end
end
