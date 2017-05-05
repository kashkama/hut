class Ability
  include CanCan::Ability

  def initialize(user)

    # user || = user.new #not logged in guest
    
    if user.admin?
      # whichever user is used as admin will manage all CRUD for all user
      can :manage, :all
    else
      # user can edit a review he/she posted
      can :update, Review do |review|
        review.user == user
      end

      # can also delete the review
      can :destroy, Review do |review|
        review.user == user
      end

      # user cannot edit after submitting booking
      # can :update, Booking do |booking|
      #   booking.user == user
      # end

      # cannot delete the submitted booking
      # can :destroy, Booking do |booking|
      #   booking.user == user
      # end

      # user can edit house attributes
      can :update, House do |house|
        house.user == user
      end

      # user can destroy house attributes
      can :destroy, House do |house|
        house.user == user
      end

      # can only edit user attributes but not delete
      can :update, User do |user|
        user.user == user
      end

      can :create, Review
      can :create, Booking
      can :create, House
      can :create, User
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
