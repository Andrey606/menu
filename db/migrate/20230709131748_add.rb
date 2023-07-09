class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :pdf_files, :url, :string
  end
end
