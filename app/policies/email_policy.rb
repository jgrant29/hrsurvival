class EmailPolicy < ApplicationPolicy

  def index?
    create?
  end

  def create? 
    user.present? && user.admin?
  end

  def update?
    create?
  end

  def show?
    create?
  end
end
