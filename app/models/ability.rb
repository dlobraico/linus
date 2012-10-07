class Ability
  include CanCan::Ability

  def initialize(editor)
    editor ||= Editor.new
    if editor.has_role? :super_admin
      can :manage, :all
    else if editor.has_role? :editor_in_chief
      can :manage, :all
    else if editor.has_role? :managing_editor
      can :read, :all
      can :write, :issue
    else if editor.has_role? :head_copy_editor
      can :manage, :submissions
      can :read, :ideas
    else if editor.has_role? :copy_editor
      can :write, :submissions
    else if editor.has_role? :secretary
      can :manage, :ideas
      can :manage, :assignments
    else if editor.has_role? :layout_editor
      can :read, :all
    else
      can :read, :ideas
    end
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
