class RenameBookTitleColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :book_title, :title
  end
end
