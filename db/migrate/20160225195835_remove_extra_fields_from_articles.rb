class RemoveExtraFieldsFromArticles < ActiveRecord::Migration
  def change
      remove_column :articles, :description, :string
      remove_column :articles, :published, :boolean
      remove_column :articles, :image, :string
      remove_column :articles, :created_at, :datetime
      remove_column :articles, :updated_at, :datetime
      remove_column :articles, :article_image, :string
      remove_column :articles, :blogpicture, :string
  end
end
