class AddViewToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :view, :boolean, :default => false
  end
end
