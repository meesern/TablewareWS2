class AddCommuninque < ActiveRecord::Migration
  def self.up
    create_table :communiques do |t|
      t.text     :message
      t.text     :originator
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :communiques
  end
end
