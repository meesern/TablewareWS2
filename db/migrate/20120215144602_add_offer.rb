class AddOffer < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string   :name
      t.string   :thumb
      t.string   :image
      t.string   :title
      t.string   :url1
      t.string   :url2
      t.string   :url3
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :dishes, :title, :string
    add_column :dishes, :url1, :string
    add_column :dishes, :url2, :string
    add_column :dishes, :url3, :string

    add_column :codes, :dish_id, :integer
    add_column :codes, :offer_id, :integer
    remove_column :codes, :identifies

    add_index :codes, [:dish_id]
    add_index :codes, [:offer_id]
  end

  def self.down
    remove_column :dishes, :title
    remove_column :dishes, :url1
    remove_column :dishes, :url2
    remove_column :dishes, :url3

    remove_column :codes, :dish_id
    remove_column :codes, :offer_id
    add_column :codes, :identifies, :integer

    drop_table :offers

    remove_index :codes, :name => :index_codes_on_dish_id rescue ActiveRecord::StatementInvalid
    remove_index :codes, :name => :index_codes_on_offer_id rescue ActiveRecord::StatementInvalid
  end
end
