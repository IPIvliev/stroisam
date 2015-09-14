class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :user_id
      t.text :text, :limit => 250000
      t.string :image
      t.string :description
      t.string :keywords

      t.timestamps null: false
    end
  end
end
