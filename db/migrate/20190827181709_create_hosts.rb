class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :date      
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
