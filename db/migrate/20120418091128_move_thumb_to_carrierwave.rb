class MoveThumbToCarrierwave < ActiveRecord::Migration
  def self.up
    remove_column :dishes, :thumb
  end

  def self.down
    add_column :dishes, :thumb, :string
  end
end
