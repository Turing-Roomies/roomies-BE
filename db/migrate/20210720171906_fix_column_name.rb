class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :roomies, :roomie_a_id, :requestor_id
    rename_column :roomies, :roomie_b_id, :receiver_id
  end
end
