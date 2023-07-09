class DestroyBinaryFromPdf < ActiveRecord::Migration[7.0]
  def change
    remove_column :pdf_files, :file, :binary
  end
end
