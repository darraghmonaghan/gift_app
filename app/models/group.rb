class Group < ActiveRecord::Base

	has_many :memberships
	has_many :users, :through => :memberships
	has_many :invites
	has_one owner (:user)

end
