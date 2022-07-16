class ChangeColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :order_services, :service_id, true
  end
end
