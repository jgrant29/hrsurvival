class AddWebsiteurlToBooks < ActiveRecord::Migration
  def change
    add_column :books, :websiteurl, :string
  end
end
