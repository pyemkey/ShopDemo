class OrdersController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @order = Order.new
  end

  def create
    listing = Listing.find(params[:listing_id])
    @order = listing.orders.build(secure_params)
    @order.user = current_user
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def secure_params
      params.require(:order).permit(:city, :address, :state)
    end
end