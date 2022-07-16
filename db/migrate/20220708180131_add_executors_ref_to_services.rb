class AddExecutorsRefToServices < ActiveRecord::Migration[7.0]
  def change
    add_reference :executors, :service, index: true, foreign_key: true
  end
end
