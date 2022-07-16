class Order < ApplicationRecord
  has_many :order_services, dependent: :destroy
  has_many :services, through: :order_services
  has_many :executors, through: :order_services

  validates :customer_name, presence: true
  validates :service_ids, presence: true
  validates :executor_ids, presence: true

  after_create :set_order_number

  private 

  def set_order_number
    update_columns(number: "№#{SecureRandom.random_number(10000)}")
  end
end
