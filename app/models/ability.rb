class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    case user.role
      when 'Admin'
        can :manage, :all
      when 'Manager'
        can :manage, :all
        cannot :manage, AdminUser
      when 'Content Manager'
        can :update, :all
        can :create, :all
        can :read, :all
        cannot :manage, AdminUser
    end    
  end

end