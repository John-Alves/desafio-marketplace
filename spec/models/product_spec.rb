require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) { @product = build :product }

  it 'is valid with valid attributes' do
    expect(@product).to be_valid
  end

  it 'is valid without image' do
    @product.image = nil
    expect(@product).to be_valid
  end

  it 'is not valid without store' do
    @product.store = nil
    expect(@product).to_not be_valid
  end

  it 'is not valid without name' do
    @product.name = nil
    expect(@product).to_not be_valid
  end

  it 'is not valid without url' do
    @product.url = nil
    expect(@product).to_not be_valid
  end

  it 'is not valid without price' do
    @product.price = nil
    expect(@product).to_not be_valid
  end
end
