class CreateTableofcontents < ActiveRecord::Migration
  def change
    create_table :tableofcontents do |t|
      t.string :title
      t.string :description
      t.text :body
      t.boolean :public, default: true
      t.string :author

      t.timestamps null: false
    end
  end
end
