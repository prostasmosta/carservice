class Service < ApplicationRecord
  has_many :executors, presence: true
end
