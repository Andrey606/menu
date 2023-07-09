class RemoveUrlFromPdf < ActiveRecord::Migration[7.0]
  def change
    remove_column :pdf_files, :url, :binary
  end
end
