class AddBookToTableofcontents < ActiveRecord::Migration
  def change
    add_column :tableofcontents, :book_id, :integer
    add_index :tableofcontents, :book_id
  end
end
