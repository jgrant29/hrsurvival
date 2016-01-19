class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :body
      t.boolean :published, default: true
      t.boolean :public, default: true
      t.string :author

      t.timestamps null: false
    end
  end
end
