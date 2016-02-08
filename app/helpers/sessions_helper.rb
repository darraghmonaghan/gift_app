module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logged_in?
    if @current_user == nil
      redirect_to "/sessions/new"
    end
  end

  def signed_in?
    if current_user == nil
      return false
    else
      return true
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
  end

end
