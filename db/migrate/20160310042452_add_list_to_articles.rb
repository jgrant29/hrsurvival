class AddListToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :hiring, :boolean
    add_column :articles, :firing, :boolean
    add_column :articles, :good_read, :boolean
    add_column :articles, :holidays_vacations, :boolean
    add_column :articles, :forms_policies, :boolean
    add_column :articles, :leave_disability, :boolean
    add_column :articles, :management, :boolean
    add_column :articles, :performance, :boolean
    add_column :articles, :safety_health, :boolean
    add_column :articles, :wages, :boolean
    add_column :articles, :webinars_events, :boolean
    add_column :articles, :harrassment, :boolean
  end
end
