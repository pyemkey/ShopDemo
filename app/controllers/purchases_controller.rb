class PurchasesController < ApplicationController

  def index
    @purchases = current_user.orders
  end
end