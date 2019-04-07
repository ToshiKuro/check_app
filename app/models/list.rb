class List < ApplicationRecord

  has_many :owners
  has_many :users, through: :owners
  has_many :items

  validates :name, presence: true, uniqueness: true, format: { with: /[A-Z0-9]/ }

end
