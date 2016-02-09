class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
    render :index
  end

  def show
  	@group = Group.find(params[:id])

    @founder = User.find(@group.user_id)

  end

  def new
  	@group = Group.new
  end

  def create
    @group = Group.create(group_params)
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
