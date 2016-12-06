class Ability
  include CanCan::Ability

  def initialize(user)
    # CanCanCan assumes that you have a method called current_user which is avail in the application controller.
    # you don't have to creat an Ability object.
    #if current_user is not nil then it will use it otherwise it will set User to a new User instance.
    user ||= User.new
    if user.is_admin?
        can :manage, :all
    else
        can :read, :all
    end
  end
end
