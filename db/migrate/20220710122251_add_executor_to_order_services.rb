class AddExecutorToOrderServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_services, :executor, index: true, foreign_key: true
  end
end
