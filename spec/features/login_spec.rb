require "rails_helper"

RSpec.feature 'Login', type: :feature do
  before(:each) do
    @password = '123456'
    @store = create(:store, password: @password)
  end

  scenario 'Try to sign in with a valid store user' do
    visit new_store_session_path

    fill_in "Email", with: @store.email
    fill_in "Password", with: @password

    click_button "Login"
    expect(current_path).to eq root_path
  end

  scenario 'Try to sign in with invalid email' do
    visit new_store_session_path

    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: @password

    click_button "Login"
    expect(current_path).to eq(new_store_session_path)
  end

  scenario 'Try to sign in with invalid password' do
    visit new_store_session_path

    fill_in "Email", with: @store.email
    fill_in "Password", with: @store.email

    click_button "Login"
    expect(current_path).to eq(new_store_session_path)
  end
end