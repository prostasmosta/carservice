class Service < ApplicationRecord
  belongs_to :service_category
  has_many :executors

  validates :title, presence:true, uniqueness: true
end
