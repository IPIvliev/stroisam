class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :avarat, :string
  end
end
