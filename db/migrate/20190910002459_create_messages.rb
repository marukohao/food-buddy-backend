class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :user_name
      t.integer :host_id
      t.string :message

      t.timestamps
    end
  end
end
