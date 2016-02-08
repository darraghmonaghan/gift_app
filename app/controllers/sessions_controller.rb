class SessionsController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.confirm(params)
  	if @user
  		login(@user)
  		redirect_to user_show(@user.id)
  	else 
  		redirect_to sessions_new_path
  	end
  end


  def destory
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
