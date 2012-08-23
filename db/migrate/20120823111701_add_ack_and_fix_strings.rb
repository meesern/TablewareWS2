class AddAckAndFixStrings < ActiveRecord::Migration
  def self.up
    add_column :communiques, :ack, :boolean
    change_column :communiques, :message, :string, :limit => 255

    change_column :customers, :uname, :string, :limit => 255
    change_column :customers, :known_name, :string, :limit => 255

    change_column :parties, :name, :string, :limit => 255
  end

  def self.down
    remove_column :communiques, :ack
    change_column :communiques, :message, :text

    change_column :customers, :uname, :text
    change_column :customers, :known_name, :text

    change_column :parties, :name, :text
  end
end
