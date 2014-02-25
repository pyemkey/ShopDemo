class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new                 
	end

	def create
		@listing = Listing.new(secure_params)
		if @listing.save
			redirect_to root_path
		else
			render :new
		end

	end

	private
		def secure_params
			params.require(:listing).permit(:name, :description, :price, :listing_image)
		end
end