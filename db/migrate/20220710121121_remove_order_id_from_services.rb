class RemoveOrderIdFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :order_id, :integer, foreign_key: false
  end
end
