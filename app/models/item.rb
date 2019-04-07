class Item < ApplicationRecord

  belongs_to :list
  mount_uploader :file, UploadFileUploader

  # validates :url, presence: true
  # validates :file, presence: true

end