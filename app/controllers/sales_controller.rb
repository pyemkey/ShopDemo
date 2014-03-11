class SalesController < ApplicationController

  def index
    @orders = Order.where("listing_id in (?)", current_user.listings.map { |listing| listing.id })
  end
end