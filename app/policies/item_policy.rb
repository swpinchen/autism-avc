class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end
  
  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
