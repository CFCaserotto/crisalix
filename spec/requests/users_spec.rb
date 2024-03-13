require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users/sign_up' do
    it 'creates a new user' do
      user_params = {
        user: {
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        }
      }

      post '/users', params: user_params
      expect(response).to be_redirect
    end

    it "returns list of all users" do
      get root_path
      expect(response).to be_successful
      expect(response.body).to include("WELLCOME TO CRISALIX")
    end
  end

  describe 'POST /users/sign_in' do
    let(:user) { create(:user) }

    context 'with valid credentials' do
      it 'signs in the user' do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include('Signed in successfully.')
      end
    end
    context 'with invalid credentials' do
        it 'does not sign in the user' do
          post user_session_path, params: { user: { email: 'invalid@example.com', password: 'invalid_password' } }
          #puts response.body
          expect(response).to have_http_status(:ok)
          expect(response.body).to include('Invalid Email or password.')
        end
    end
  end

  describe 'DELETE /users/sign_out' do
    let(:user) { create(:user) }
    
    it 'signs out the user' do
      sign_in user
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path) 
      follow_redirect!
      expect(response.body).to include('Signed out successfully.')
    end
  end

end
