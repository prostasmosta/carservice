class Executor < ApplicationRecord
  has_many :order_services, dependent: :nullify
  has_many :services, through: :order_services
  has_many :orders, through: :order_services

  validates :name, presence: true, uniqueness: true
end
