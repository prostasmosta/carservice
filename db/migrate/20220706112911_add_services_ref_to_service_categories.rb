class AddServicesRefToServiceCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :service_category, index: true, foreign_key: true
  end
end
