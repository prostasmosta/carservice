class Executor < ApplicationRecord
  belongs_to :service, optional: true

  validates :name, presence:true, uniqueness: true
end
