class AddTextToTableofcontent < ActiveRecord::Migration
  def change
    add_column :tableofcontents, :text, :binary
  end
end
