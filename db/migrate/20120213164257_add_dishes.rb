class AddDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string   :name
      t.string   :thumb
      t.string   :image
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :dishes
  end
end
