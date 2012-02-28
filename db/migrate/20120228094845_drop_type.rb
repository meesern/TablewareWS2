class DropType < ActiveRecord::Migration
  def self.up
    remove_column :codes, :type
  end

  def self.down
    add_column :codes, :type, :string
  end
end
