class InvitesController < ApplicationController
  
def new
  	@invite = Invite.new
end

def create
	puts 'HERE ARE THE PARAMS'
	puts invite_params
	
	@invite = Invite.new(invite_params) # Make a new Invite
	@invite.sender_id = current_user.id # set the sender to the current user
	   
	   if @invite.save
	      
	   	  	if @invite.recipient != nil
		   	  	InviteMailer.invite_existing_user(@invite).deliver
				# group = Group.find(@invite.group_id)
				@invite.recipient.memberships.push(@invite.group.memberships)

		  	else
			    InviteMailer.group_invite(@invite, users_new_path(:invite_token => @invite.token)).deliver_now #send the invite data to our mailer to deliver the email
			end
	   # else
	      # REDIRECT ???
	   end
	   redirect_to show_group_path(@invite.group)
end


private

  def invite_params
    params.require(:invite).permit(:group_id, :email)  
  end

end