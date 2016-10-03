class AddPinToEvents < ActiveRecord::Migration
  def change
    add_column :events, :pin, :boolean
  end
end
