require 'rails_helper'

RSpec.describe "Stores", type: :request do
  context 'not logged in' do
    it 'should return products page' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'should redirect when try to access admin page' do
      get rails_admin_path
      expect(response).to have_http_status(302)
    end
  end

  context 'logged in' do
    login_store

    it 'should allow access to admin page' do
      get rails_admin_path
      expect(response).to have_http_status(:success)
    end
  end
end
