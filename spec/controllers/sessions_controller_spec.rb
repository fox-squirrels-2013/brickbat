require 'spec_helper'

describe SessionsController do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  describe '#create' do
    it 'should successfully create a user' do
      expect {
        post :create, provider: :twitter
      }.to change{ User.count }.by(1)
    end

    it 'should successfully create a session' do
      expect(session[:user_id]).to be_nil
      post :create, provider: :twitter
      expect(session[:user_id]).to_not be_nil
    end

    it 'should successfully redirect the user' do
      post :create, provider: :twitter
      expect(response).to redirect_to root_url
    end
  end

  describe '#destroy' do
    before do
      post :create, provider: :twitter
    end

    it 'should clear the session' do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  
    it 'should successfully redirect the user' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end