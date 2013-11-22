require 'spec_helper'

describe PostsController do

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

    @user = User.create_with_auth(request.env["omniauth.auth"])
    @post = Post.new
    @post.title = 'test title'
    @post.user_id = @user.id
  end

  let!(:post_obj) do 
    Post.create title: 'test title', body: 'test body' 
  end

  it '#index' do
    get :index    
    expect(assigns(:posts)).to eq [post_obj]
  end

  it '#new' do
    get :new
    expect(post_obj).to be_an_instance_of Post
  end

  context '#create' do
    
    it 'creates a post with valid params' do
      expect{ 
        @post.body = 'test body'       
        @post.save
      }.to change(Post, :count).by 1
    end

    it 'does not create a post with invalid params' do
      expect{
        @post.save
      }.to change(Post, :count).by 0
    end
  end

  it '#show' do
    get :show, id: post_obj.id
    expect(assigns(:post).title).to eq 'test title'
  end

end
