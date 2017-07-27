class SessionsController < ApplicationController

	def new

	end

	def signup

	end

	def create
		user =  User.find_by(name: params[:user][:name])

		authenticated = user.try(:authenticate, params[:user][:password])
        if authenticated
   	    	@user = user
   			session[:user_id] = @user.id
   			redirect_to welcome_path
   		else
   			redirect_to login_path
   		end
	end

end