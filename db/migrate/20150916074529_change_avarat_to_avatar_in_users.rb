class ChangeAvaratToAvatarInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :avarat, :avatar
  end
end
