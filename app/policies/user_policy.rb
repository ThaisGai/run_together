# app/policies/user_policy.rb

class UserPolicy < ApplicationPolicy
  def show?
    true  # qualquer um pode ver perfil
  end

  def edit?
    user == record  # só o próprio usuário
  end

  def update?
    user == record
  end
end
