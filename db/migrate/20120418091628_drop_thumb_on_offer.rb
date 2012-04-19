class DropThumbOnOffer < ActiveRecord::Migration
  def self.up
    remove_column :offers, :thumb
  end

  def self.down
    add_column :offers, :thumb, :string
  end
end
