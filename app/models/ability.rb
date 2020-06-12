# frozen_string_literal: true

class Ability
  include Mongoid::Document
  include CanCan::Ability

  def initialize(store)
    if store
      can :manage, :rails_admin
      can :read, :dashboard

      can :manage, Product, store_id: store.id
      can [:read, :update], Store, _id: store.id
    end
  end
end
