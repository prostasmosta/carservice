class ServiceCategory < ApplicationRecord
  has_many :services, dependent: :destroy
  validates :title, presence:true, uniqueness: true
end
