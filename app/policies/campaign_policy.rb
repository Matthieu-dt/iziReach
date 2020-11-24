class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    record.company.user == user
  end

  def create?
    user.company == true
  end

  def update?
    record.company.user == user
  end

  def show?
    record.company.user == user
  end
end
