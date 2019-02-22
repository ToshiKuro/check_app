class User < ApplicationRecord

  has_many :lists, through: :owners
  has_many :owners

end

  # validates :name, presence: true
  # validates :name, uniqueness: true