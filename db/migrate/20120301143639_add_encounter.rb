class AddEncounter < ActiveRecord::Migration
  def self.up
    create_table :encounters do |t|
      t.datetime :date
      t.string   :comment
      t.integer  :rating
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :dish_id
    end
    add_index :encounters, [:user_id]
    add_index :encounters, [:dish_id]
  end

  def self.down
    drop_table :encounters
  end
end
