class Service < ApplicationRecord
  belongs_to :service_category
  has_many :order_services, dependent: :nullify
  has_many :orders, through: :order_services
  has_many :executors, through: :order_services

  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
