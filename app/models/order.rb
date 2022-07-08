class Order < ApplicationRecord
  has_many :services, through: :service_categories
  has_many :executors, through: :services

  after_create :set_order_number

  private 

  def set_order_number
    number = SecureRandom.random_number(10000)
  end
end
