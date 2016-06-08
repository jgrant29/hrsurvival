class AddFriendlyIdToTableofcontent < ActiveRecord::Migration
  def change
    add_column :tableofcontents, :slug, :string
    add_index :tableofcontents, :slug
  end
end
