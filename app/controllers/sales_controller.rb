class SalesController < ApplicationController

  def index
    @orders = Order.received_by(current_user)
  end
end