class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def create?
      user.company == true
    end

    def update?
      record.influencer == user
    end

    def index?
      record.influencer == user || record.campaign.company.user == user
    end

    def destroy?
      record.campaign.company.user == user
    end
  end
end
