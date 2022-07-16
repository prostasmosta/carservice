class AddPriceToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :price, :decimal, :precision => 8, :scale => 2
    add_column :services, :exec_time, :integer
  end
end
