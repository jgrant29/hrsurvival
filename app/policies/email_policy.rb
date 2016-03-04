class EmailPolicy < ApplicationPolicy

  def index?
    user.present? && user.admin?
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
