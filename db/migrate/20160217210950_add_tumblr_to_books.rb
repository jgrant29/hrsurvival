class AddTumblrToBooks < ActiveRecord::Migration
  def change
    add_column :books, :tumblr, :string
  end
end
