class SessionsController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.confirm(params)
  	if @user
  		login(@user)
  		redirect_to show_user_path(@user.id)
  	else 
  		redirect_to sessions_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:email, :password)  
  end

end
