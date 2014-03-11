class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new                 
	end

	def create
		@listing = current_user.listings.build(secure_params)
		if @listing.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = get_listing(params[:id])
	end

	def destroy
		@listing = get_listing(params[:id])
		@listing.destroy
		redirect_to root_path
	end

	def update
		@listing = get_listing(params[:id])
		if @listing.update_attributes(secure_params)
			redirect_to @listing
		else
			redirect_to edit_listing_path(@listing)
		end
	end

	private
		def secure_params
			params.require(:listing).permit(:name, :description, :price, :listing_image)
		end

		def get_listing(listing_id)
			current_user.listings.find(listing_id)
		end
		# def listing
		# 	@_listing ||= current_user.listings.find(params[:id])
		# end
end