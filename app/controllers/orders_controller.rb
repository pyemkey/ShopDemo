class OrdersController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @order = Order.new
  end

  def create
    card_token = params[:order][:stripe_token]
  
    listing = Listing.find(params[:listing_id])
    amount = (listing.price * 100).to_i
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: card_token
      )
    @order = listing.orders.build(secure_params)
    @order.user = current_user
    if @order.save
      redirect_to root_path
    else
      render :new
    end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private

    def secure_params
      params.require(:order).permit(:city, :address, :state, :stripe_token)
    end
end