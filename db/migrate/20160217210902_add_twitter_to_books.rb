class AddTwitterToBooks < ActiveRecord::Migration
  def change
    add_column :books, :twitter, :string
  end
end
