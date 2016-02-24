class AddBlogpictureToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :blogpicture, :string
  end
end
