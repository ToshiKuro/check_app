class User < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  has_many :flight_numbers
end
