class SessionsController < ApplicationController
	def create
  	auth = request.env['omniauth.auth']
  	# debugger
  	@user = User.find_by_uid(auth.info.uid.to_i) || User.create_with_auth(auth)
  	session[:user_id] = @user.id if @user
  	redirect_to '/'
  end
  def destroy
  	session.clear
  	redirect_to '/'
  end
end