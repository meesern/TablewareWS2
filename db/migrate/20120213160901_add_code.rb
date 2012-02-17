class AddCode < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string   :codepoint
      t.string   :type
      t.integer  :identifies
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :codes
  end
end
