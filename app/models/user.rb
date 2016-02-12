class User < ActiveRecord::Base

	has_secure_password
	has_many :memberships
	has_many :groups, :through => :memberships
	has_many :gifts
	has_many :posts

	has_many :invitations, :class_name => 'Invite', :foreign_key => 'recipient_id'
	has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'

    def self.confirm(params)
        @user = User.find_by({email: params[:email]})
        @user.try(:authenticate, params[:password])
    end

end
