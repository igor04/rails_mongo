class UserController < ApplicationController
	def index
		@user = UserDecorator.find current_user
	end

	def show
		@user = User.find_by_slug params[:id]
	end
end