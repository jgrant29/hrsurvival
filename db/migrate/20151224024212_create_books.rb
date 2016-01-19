class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :chamber
      t.boolean :public, default: true
      t.boolean :published

      t.timestamps null: false
    end
  end
end
