require "rails_helper"

RSpec.feature 'Registration', type: :feature do
  before(:each) do
    @password = '123456'
    @store = build(:store, password: @password)
  end

  scenario 'Try to sign up with a valid store data' do
    visit new_store_registration_path

    fill_in "store_name", with: @store.name
    find('input[type="file"]').set(Rails.root.join('spec', 'fixtures', 'logo.jpg'))
    fill_in "store_email", with: @store.email
    fill_in "store_password", with: @password
    fill_in "store_password_confirmation", with: @password

    click_button "Continuar"
    expect(current_path).to eq root_path
  end

  scenario 'Try to sign up without a name' do
    visit new_store_registration_path

    find('input[type="file"]').set(Rails.root.join('spec', 'fixtures', 'logo.jpg'))
    fill_in "store_email", with: @store.email
    fill_in "store_password", with: @password
    fill_in "store_password_confirmation", with: @password

    click_button "Continuar"
    expect(page).to have_text('Não foi possível salvar loja')
  end

  scenario 'Try to sign up without a file' do
    visit new_store_registration_path

    fill_in "store_name", with: @store.name
    fill_in "store_email", with: @store.email
    fill_in "store_password", with: @password
    fill_in "store_password_confirmation", with: @password

    click_button "Continuar"
    expect(page).to have_text('Não foi possível salvar loja')
  end

  scenario 'Try to sign up without a email' do
    visit new_store_registration_path

    fill_in "store_name", with: @store.name
    find('input[type="file"]').set(Rails.root.join('spec', 'fixtures', 'logo.jpg'))
    fill_in "store_password", with: @password
    fill_in "store_password_confirmation", with: @password

    click_button "Continuar"
    expect(page).to have_text('Não foi possível salvar loja')
  end

  scenario 'Try to sign up without a password' do
    visit new_store_registration_path

    fill_in "store_name", with: @store.name
    find('input[type="file"]').set(Rails.root.join('spec', 'fixtures', 'logo.jpg'))
    fill_in "store_email", with: @store.email

    click_button "Continuar"
    expect(page).to have_text('Não foi possível salvar loja')
  end

  scenario 'Try to sign up with wrong password confirmation' do
    visit new_store_registration_path

    fill_in "store_name", with: @store.name
    find('input[type="file"]').set(Rails.root.join('spec', 'fixtures', 'logo.jpg'))
    fill_in "store_email", with: @store.email
    fill_in "store_password", with: @password
    fill_in "store_password_confirmation", with: '000000'

    click_button "Continuar"
    expect(page).to have_text('Não foi possível salvar loja')
  end
end