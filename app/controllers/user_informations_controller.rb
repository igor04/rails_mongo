class UserInformationsController < ApplicationController
	def edit
		@user_information = current_user.user_information
	end
	
	def update
		@user_information = current_user.user_information
		@user_information.update_attributes(params[:user_information])
		redirect_to current_user
	end
end