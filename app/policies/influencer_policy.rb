class InfluencerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def create?
      true
    end

    def update?
      record.user == user
    end
  end
end
