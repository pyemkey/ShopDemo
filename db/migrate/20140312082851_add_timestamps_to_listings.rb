class AddTimestampsToListings < ActiveRecord::Migration
  def change
    add_timestamps(:listings)
  end
end
