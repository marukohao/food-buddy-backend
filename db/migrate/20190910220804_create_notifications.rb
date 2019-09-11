class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :host_id
      t.boolean :new
      t.integer :user_id

      t.timestamps
    end
  end
end
