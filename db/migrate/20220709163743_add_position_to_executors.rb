class AddPositionToExecutors < ActiveRecord::Migration[7.0]
  def change
    add_column :executors, :position, :string
  end
end
