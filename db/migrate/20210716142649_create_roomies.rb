class CreateRoomies < ActiveRecord::Migration[5.2]
  def change
    create_table :roomies do |t|
      t.integer :roomie_a_id
      t.integer :roomie_b_id

      t.timestamps
    end
  end
end
