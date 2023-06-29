class AddLocaleToPdf < ActiveRecord::Migration[7.0]
  def change
    add_column :pdf_files, :locale, :string
  end
end
