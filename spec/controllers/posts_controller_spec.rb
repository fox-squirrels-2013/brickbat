require 'spec_helper'

describe PostsController do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:post) { FactoryGirl.create(:post) }
  let(:post_attrs) { FactoryGirl.attributes_for(:post) }

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    session[:user_id] = user.id
  end

  it '#index' do
    get :index
    expect(assigns(:posts)).to eq [post]
  end

  it '#new' do
    get :new
    expect(assigns(:post)).to be_an_instance_of Post
  end

  it '#show' do
    get :show, id: post.id
    expect(assigns(:post).title).to eq post.title
  end

end
