class AddFacebookToBooks < ActiveRecord::Migration
  def change
    add_column :books, :facebook, :string
  end
end
