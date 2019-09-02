class AddPartyToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :party, :integer
  end
end
