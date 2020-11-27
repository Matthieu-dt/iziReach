class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def index?
      record.influencer == user || record.campaign.company.user == user
    end

  end
    def create?
      record.campaign.company.user == user
    end

    def update?
      record.influencer.user == user
    end
    def destroy?
      record.campaign.company.user == user
    end
end
