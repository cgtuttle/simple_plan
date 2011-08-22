class Ability
	include CanCan::Ability
	
	def initialize(user)
		case user.role
		when 'sysadmin'
			can :manage, :all
		when 'admin'
			can :manage, Account
			can :manage, User
		when 'manager'
		when 'user'
			can :manage, Account
			can :dashboard, User
		else
		end
		
	end
end