class AddYoutubeToBooks < ActiveRecord::Migration
  def change
    add_column :books, :youtube, :string
  end
end
