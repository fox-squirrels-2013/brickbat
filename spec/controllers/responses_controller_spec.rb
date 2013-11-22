require 'spec_helper'

describe ResponsesController do

  let!(:post_obj) { Post.create title: 'test title', body: 'test body'}
  let!(:valid_response) { {body: 'test body'} }

  it '#new' do
    get :new, :post_id => post_obj.id
    expect(assigns(:response)).to be_an_instance_of Response
  end

  context '#create' do
    
    it 'creates a response with valid params' do
      expect{
      post :create, :post_id => post_obj.id, response: valid_response
      }.to change(Response, :count).by 1
    end

    it 'does not create a response with invalid params' do
      expect{
      post :create, :post_id => post_obj.id, response: {}
      }.to change(Response, :count).by 0
    end
  end

  context '#vote' do
    # expect{
    #   post :create, :post_id => post_obj.id, response: valid_response
    # }

  end
end
