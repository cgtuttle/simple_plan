class Ability
	include CanCan::Ability
	
	def initialize(user)
		case user.role
		when 'sysadmin'
			can :manage, :all
		when 'admin'
			can :manage, Account
		when 'manager'
		when 'user'
		else
		end
		
	end
end