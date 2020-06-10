require 'rails_helper'

RSpec.describe Store, type: :model do
  before(:each) { @store = build :store }

  it 'is valid with valid attributes' do
    expect(@store).to be_valid
  end

  it 'is not valid without name' do
    @store.name = nil
    expect(@store).to_not be_valid
  end

  it 'is not valid without image' do
    @store.image = nil
    expect(@store).to_not be_valid
  end

  it 'is not valid without password' do
    @store.password = nil
    expect(@store).to_not be_valid
  end
end
