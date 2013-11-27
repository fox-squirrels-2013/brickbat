class SessionsController < ApplicationController
	def create
  	auth = request.env['omniauth.auth']
  	@user = User.find_by_uid(auth.uid.to_i) || User.create_with_auth(auth)
  	login @user
  	redirect_to root_path
  end

  def destroy
  	session.clear
  	redirect_to root_path
  end
end
