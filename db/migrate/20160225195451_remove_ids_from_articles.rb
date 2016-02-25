class RemoveIdsFromArticles < ActiveRecord::Migration
def change 
  remove_column :articles, :id
end
end
