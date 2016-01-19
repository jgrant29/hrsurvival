class AddChaptersToTableofcontents < ActiveRecord::Migration
  def change
    add_column :tableofcontents, :chapter_id, :integer
    add_index :tableofcontents, :chapter_id
  end
end
