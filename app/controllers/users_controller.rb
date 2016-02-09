class UsersController < ApplicationController

  def index
      @users = User.all
      render :index
  end



  def show
      group_ids = []
      @group_objects = []
      id = params[:id]

          @user = User.find(params[:id])
          if current_user.id == @user.id
              
              @user.memberships.each do | a |
                  id = a.group_id
                  group_ids.push(id)
              end


              group_ids.each do | a |
                  if a != nil
                    object = Group.find(a)
                    @group_objects.push(object)
                  end
              end


            render :show
          else
            redirect_to root_path
          end
  end




  def new
      @user = User.new
  end

  def create
      @user = User.create(user_params)
      if @user.save
          login(@user)
          redirect_to show_user_path(@user.id)
      else
          redirect_to root_path
      end
  end


  def edit
      @user = User.find(params[:id])
    if @user.id == current_user.id
        render :edit
    else
      redirect_to root_path
    end
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to root_path
  end


private

  def user_params
    params.require(:user).permit(:firstname, :surname, :email, :password)  
  end


end
