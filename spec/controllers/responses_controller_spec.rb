require 'spec_helper'

describe ResponsesController do

  let!(:response_obj) { Response.create body: 'test body'}
  let!(:post_obj) { Post.create title: 'test title', body: 'test body'}


  it '#new' do
    get :new, post_id: post_obj.id
    expect(assigns(:response)).to be_an_instance_of Response
  end

  context '#create' do

    let!(:response_params) { { body: 'test body', post_id: post_obj.id } }
    
    it 'creates a post with valid params' do
      expect{
      post :create, response: response_params, post_id: post_obj.id
      # expect(assigns(:response).body).to eq 'test body'
      }.to change(Response, :count).by 1
    end

    it 'does not create a post with invalid params' do
      expect{
      post :create, response: { }, post_id: post_obj.id 
      }.to change(Response, :count).by 0
    end
  end


end
