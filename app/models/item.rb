class Item < ApplicationRecord

  belongs_to :list
  mount_uploader :file, UploadFileUploader

end