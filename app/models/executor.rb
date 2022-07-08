class Executor < ApplicationRecord
  belongs_to :service

  validates :name, presence:true, uniqueness: true
end
