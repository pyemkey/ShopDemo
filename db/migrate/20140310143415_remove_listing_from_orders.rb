class RemoveListingFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :listing_id, :integer
  end
end
