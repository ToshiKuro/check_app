class List < ApplicationRecord

  scope :item_select, -> (list_names) { where(name: list_names).group(:address).order(:id) }

end
