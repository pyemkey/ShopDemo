class OrdersController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @order = Order.new
  end

  def create
    listing = Listing.find(params[:listing_id])
    @order = listing.orders.build(secure_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  private

    def secure_params
      params.require(:order).permit(:city, :address, :state)
    end
end