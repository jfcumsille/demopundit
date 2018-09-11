class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, project)
    @user = user
    @project = project
    @user_role = UserJoinProject.where('user_id = ? AND project_id = ?',
                                        @user.id, @project.id)[0].role.name
  end

  def show?
    true
  end

  def delete?
    if @user_role
      @user_role == 'owner'
    else
      false
    end
  end

  def update?
    if @user_role
      @user_role == 'owner' || @user_role == 'manager' ||
        @user_role == 'developer'
    else
      false
    end
  end

  def assing?
    if @user_role
      @user_role == 'owner' || @user_role == 'manager'
    else
      false
    end
  end
end
