class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.string :email
      t.string :company
      t.boolean :permissions, default: true

      t.timestamps null: false
    end
  end
end
