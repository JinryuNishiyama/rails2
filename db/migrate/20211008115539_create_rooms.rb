class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :title
      t.string :address
      t.integer :fee
      t.text :information

      t.timestamps
    end
  end
end
