class AddPinToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :pin, :boolean
  end
end
