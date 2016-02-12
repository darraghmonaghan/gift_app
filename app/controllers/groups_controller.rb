class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    render :index
  end

  def show
    @post = Post.new
  	@group = Group.find(params[:id])
    @founder = User.find(@group.user_id)
    @members = Membership.where(:group_id => @group.id)     ## Could refactor, just use @group.memberships.count...
  end

  def new
  	@group = Group.new
  end

  def create
    @group = Group.create(group_params)
    Membership.create(:user_id => @group.user_id, :group_id => @group.id)

      if @group.save
        redirect_to show_group_path(@group.id)
      else
        redirect_to root_path
      end
  end

private

  def group_params
    params.require(:group).permit(:title, :description, :date, :user_id)  
  end



end
