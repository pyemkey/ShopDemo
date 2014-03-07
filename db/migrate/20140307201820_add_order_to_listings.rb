class AddOrderToListings < ActiveRecord::Migration
  def change
    add_column :listings, :order_id, :integer
  end
end
