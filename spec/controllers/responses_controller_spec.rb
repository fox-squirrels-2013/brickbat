require 'spec_helper'

describe ResponsesController do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }
  let!(:response) { FactoryGirl.create(:response) }
  let!(:response_params) { FactoryGirl.attributes_for(:response) }

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    session[:user_id] = user.id
  end

  it '#new' do
    get :new, :post_id => post.id
    expect(assigns(:response)).to be_an_instance_of Response
  end

end
