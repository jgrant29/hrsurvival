class AddWeightToTableofcontents < ActiveRecord::Migration
  def change
    add_column :tableofcontents, :weight, :integer
  end
end
