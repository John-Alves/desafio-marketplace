# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(store)
    if store
      can :access, :rails_admin

      can :manage, Product, store_id: store.id
      can [:read, :update], Store, _id: store.id
    end
  end
end
