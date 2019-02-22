class List < ApplicationRecord

  has_many :owners
  has_many :users, through: :owners
  has_many :items

end


  # scope :item_select, -> (list_names) { where(name: list_names).group(:address).order(:id) }

  # belongs_to :lists
