class AddServicesRefToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :order, index: true, foreign_key: true
  end
end
