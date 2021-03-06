#### DEFINES RESTRICTIONS AND PERMISSIONS FOR ROLES ####

class Ability  
  include CanCan::Ability  
  def initialize(user)
    can :create, User 
    unless user
    else
      can :read, :all
      can :update, User, :id => user.id
      can :destroy, User, :id => user.id
      can :destroy, :session
      case user.role
      when 'admin'
        can :manage, :all
      end
    end
  end  
end