class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    record.company.user == user
  end

  # def my_campaigns?
  #   true
  # end


  def create?
    record.company.user == user
  end

  def update?
    record.company.user == user
  end

  def show?
    record.company.user == user
  end

  def destroy?
    record.company.user == user
  end
end
