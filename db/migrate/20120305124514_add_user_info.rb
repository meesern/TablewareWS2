class AddUserInfo < ActiveRecord::Migration
  def self.up
    add_column :users, :favourites, :string
    add_column :users, :offers, :string
  end

  def self.down
    remove_column :users, :favourites
    remove_column :users, :offers
  end
end
