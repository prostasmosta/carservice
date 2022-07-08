class Service < ApplicationRecord
  belongs_to :service_category
  has_one :executor, required: false

  validates :title, presence:true, uniqueness: true
end
