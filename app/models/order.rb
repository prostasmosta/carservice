class Order < ApplicationRecord
  has_many :order_services, dependent: :destroy
  has_many :services, through: :order_services
  has_many :executors, through: :order_services

  validates :customer_name, presence: true
  validates :service_ids, presence: true
  validates :executor_ids, presence: true

  after_create :set_order_number
  after_create :set_price
  after_create :set_exec_time

  private 

  def set_order_number
    update_columns(number: "№#{SecureRandom.random_number(10000)}")
  end

  def set_price
    update_columns(price: self.services.uniq.map { |s| s.price }.sum)
  end

  def set_exec_time
    update_columns(exec_time: self.services.uniq.map { |s| s.exec_time }.sum)
  end
end
