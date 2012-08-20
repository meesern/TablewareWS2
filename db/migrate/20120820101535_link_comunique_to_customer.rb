class LinkComuniqueToCustomer < ActiveRecord::Migration
  def self.up
    rename_column :communiques, :originator, :customer_id
    change_column :communiques, :customer_id, :integer

    add_index :communiques, [:customer_id]
  end

  def self.down
    rename_column :communiques, :customer_id, :originator
    change_column :communiques, :originator, :text

    remove_index :communiques, :name => :index_communiques_on_customer_id rescue ActiveRecord::StatementInvalid
  end
end
