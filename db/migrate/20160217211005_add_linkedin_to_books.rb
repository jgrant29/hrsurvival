class AddLinkedinToBooks < ActiveRecord::Migration
  def change
    add_column :books, :linkedin, :string
  end
end
