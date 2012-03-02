class UseEncounterTimestamp < ActiveRecord::Migration
  def self.up
    remove_column :encounters, :date
  end

  def self.down
    add_column :encounters, :date, :datetime
  end
end
