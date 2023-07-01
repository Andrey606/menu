class PdfFile < ApplicationRecord
  # has_one_attached :file

  validates :name, presence: true
  validates :file, presence: true

  mount_uploader :file, PdfUploaderUploader

  # def file_url
  #   Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)
  # end
end
