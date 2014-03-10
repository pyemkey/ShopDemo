class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address
      t.string :state
      t.string :city
      t.integer :listing_id
    end
  end
end
