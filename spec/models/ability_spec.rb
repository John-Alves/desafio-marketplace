require 'rails_helper'

RSpec.describe Ability, type: :model do
  before do
    @store = build :store
    @ability = Ability.new(@store)
    @another_store = build :store
  end

  context 'Store' do

    it 'can not read values from another store' do
      expect @ability.cannot?(:read, @another_store)
    end

    it 'can not update values from another store' do
      expect @ability.cannot?(:update, @another_store)
    end

    it 'can not destroy another store' do
      expect @ability.cannot?(:destroy, @another_store)
    end
  end

  context 'Product' do
    before(:each) do
      @product_from_another_store = create(:product, store: @another_store)
    end

    it 'can not read a product from another store' do
      expect @ability.cannot?(:read, @product_from_another_store)
    end

    it 'can not update a product from another store' do
      expect @ability.cannot?(:update, @product_from_another_store)
    end

    it 'can not destroy a product from another store' do
      expect @ability.cannot?(:destroy, @product_from_another_store)
    end
  end
end
