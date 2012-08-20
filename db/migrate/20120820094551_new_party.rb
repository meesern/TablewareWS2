class NewParty < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.text     :uname
      t.text     :known_name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :party_id
    end
    add_index :customers, [:party_id]

    create_table :parties do |t|
      t.text     :name
      t.integer  :table
      t.datetime :seated
      t.datetime :left
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :customers
    drop_table :parties
  end
end
