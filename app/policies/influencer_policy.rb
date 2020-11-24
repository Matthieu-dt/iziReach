class InfluencerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all    end
  end

    def create?
      true
    end

    def update?
      record.user == user
    end

    def index?
      user.company == true
    end
end
