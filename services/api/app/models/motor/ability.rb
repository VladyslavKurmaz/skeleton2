# frozen_string_literal: true

module Motor
  class Ability
    include CanCan::Ability

    def initialize(user, _request)
      return if user.blank?

      can :manage, :all
    end
  end
end
