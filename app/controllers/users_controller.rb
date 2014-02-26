class UsersController < ApplicationController

	def show
		@listings = current_user.listings
	end

end