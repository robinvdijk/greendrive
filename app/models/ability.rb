# class Ability
#   include CanCan::Ability

#   def initialize(user)
#   	if user.is_admin?
#   		can :manage, :all
#   	else
#   		can :read, :all
#   		can :update, User do |user|
#   			user.try(:user) == user
#   		end
#   	end
#   end
# end



class Ability  
  include CanCan::Ability  

  def initialize(user)
<<<<<<< HEAD
    user ||= User.new # Guest User 
=======
    user ||= User.new
    # Guest User 
>>>>>>> 9ae7702e25a6b76664191d47bf83c9a76142385c
    unless user 
      can :read, :all
    else
      # All registered users
      can :read, :all
      # Admins 
      if user.role = :admin
        can :manage, :all
      end
    end 
  end  
end