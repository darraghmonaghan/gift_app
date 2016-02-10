class InvitesController < ApplicationController
  
def new
  	@invite = Invite.new
end

def create
	@group = params[:invite][:group_id]
	@invite = Invite.new(invite_params) # Make a new Invite
	@invite.sender_id = current_user.id # set the sender to the current user
	   if @invite.save
	      Invite.create(:email => params[:invite][:group_id], :sender_id => current_user.id, :token => @invite.token)
	      InviteMailer.group_invite(@invite, users_new_path(:invite_token => @invite.token)).deliver_now #send the invite data to our mailer to deliver the email
	   	  puts 'email sent, i think......?'
	   # else
	      # REDIRECT ???
	   end
	   redirect_to show_group_path(@group)
end


private

  def invite_params
    params.require(:invite).permit(:group_id, :email)  
  end

end