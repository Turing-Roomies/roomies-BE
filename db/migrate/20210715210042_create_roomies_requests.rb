 class CreateRoomiesRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :roomie_requests do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.integer :status
      
      t.timestamps
    end
  end
end
