class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.integer :host_id
      t.integer :user_id
      t.boolean :joined
      t.boolean :declined

      t.timestamps
    end
  end
end
