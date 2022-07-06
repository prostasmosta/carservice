class AddNumberToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :number, :string
  end
end
