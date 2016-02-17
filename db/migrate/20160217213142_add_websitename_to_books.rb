class AddWebsitenameToBooks < ActiveRecord::Migration
  def change
    add_column :books, :websitename, :string
  end
end
