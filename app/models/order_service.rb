class OrderService < ApplicationRecord
  belongs_to :order
  belongs_to :service, optional: true
  belongs_to :executor, optional: true
end
