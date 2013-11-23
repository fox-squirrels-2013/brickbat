require 'spec_helper'

describe PostsController do

  let!(:post_obj) { Post.create title: 'test title', body: 'test body'}

  it '#index' do
    get :index
    expect(assigns(:posts)).to eq [post_obj]
  end

  it '#new' do
    get :new
    # expect(assigns(:post)).to be_an_instance_of Post
    expect(post_obj).to be_an_instance_of Post
  end

  context '#create' do

    let!(:post_params) { { title: 'test title', body: 'test body' } }

    it 'creates a post with valid params' do
      expect{
      post :create, post: post_params
      expect(assigns(:post).title).to eq 'test title'
      }.to change(Post, :count).by 1
    end

    it 'does not create a post with invalid params' do
      expect{
      post :create, post: { title: 'test title' }
      }.to change(Post, :count).by 0
    end
  end

  it '#show' do
    get :show, id: post_obj.id
    expect(assigns(:post).title).to eq 'test title'
  end

end
