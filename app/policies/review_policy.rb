class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def create?
      record.booking.campaign.coompany.user == user
    end
  end
end
