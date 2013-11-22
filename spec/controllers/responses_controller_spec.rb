require 'spec_helper'

describe ResponsesController do

  let!(:valid_response) { {body: 'test body'} }

  let!(:user) do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

    User.create_with_auth(request.env["omniauth.auth"])
  end

  before do
    @post = Post.new
    @post.title = 'test title'
    @post.body = 'test body'
    @post.user_id = user.id
    @post.save
  end

  it '#new' do
    get :new, :post_id => @post.id
    expect(assigns(:response)).to be_an_instance_of Response
  end

  context '#create' do
    
    it 'creates a response with valid params' do
      expect{
      post :create, :post_id => @post.id, response: valid_response
      }.to change(Response, :count).by 1
    end

    it 'does not create a response with invalid params' do
      expect{
      post :create, :post_id => @post.id, response: {}
      }.to change(Response, :count).by 0
    end
  end
end
