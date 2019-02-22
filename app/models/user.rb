class User < ApplicationRecord

  has_many :owners
  has_many :lists, through: :owners

end

  # validates :name, presence: true
  # validates :name, uniqueness: true