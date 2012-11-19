class UsersController < ApplicationController

	def create
		@user = User.new(params[:user])
		@user.save
		redirect_to users_path
	end

end