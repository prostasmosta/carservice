class RemoveServiceIdFromExecutors < ActiveRecord::Migration[7.0]
  def change
    remove_column :executors, :service_id, :integer, foreign_key: false
  end
end
