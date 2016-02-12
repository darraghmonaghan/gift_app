class UsersController < ApplicationController

  def index
      @users = User.all
      render :index
  end

  def show      
      # Preparing newsfeed and posts
      group_ids = []
      @newsfeed_posts = []

      # Preparing groups invovled in      
      @group_objects = []
      @group_owner_objects = []
      @user = current_user

      # Preparing groups owner / organiser of
      group_owner_objects = Group.where(:user_id => current_user.id)
      group_owner_objects.each do | a |
          @group_owner_objects.push(a)
      end

      @user.groups.each do | group |
          group_ids.push(group.id)
      end

      group_ids.each do | id |
          posts = Post.where(:group_id => id)
          @newsfeed_posts.push(posts)
      end


      # id = params[:id]

      #     @user = User.find(params[:id])
      #     if current_user.id == @user.id
              
      #         # preparing groups involved in
      #         @user.memberships.each do | a |
      #             id = a.group_id
      #             group_ids.push(id)
      #         end

      #         group_ids.each do | a |
      #             if a != nil
      #               object = Group.find(a)
      #               @group_objects.push(object)
      #             end
      #         end

      #       render :show
      #     else
      #       redirect_to root_path
      #     end
  end




  def new
      @user = User.new
      @token = params[:invite_token]
  end

  def create
      @user = User.create(user_params)
      @token = params[:invite_token]
      if @user.save
          login(@user)

          if @token != nil
              group = Invite.find_by_token(@token).group
              @user.memberships.push(group)
          end

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
