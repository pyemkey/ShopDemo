class RemoveOrderFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :order_id, :integer
  end
end
