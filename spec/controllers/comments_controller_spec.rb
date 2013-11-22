require 'spec_helper'

describe CommentsController do
  let!(:post_obj) { Post.create title: 'test title', body: 'test body' }
  let!(:response_obj) { Response.create body: 'test body' }
  let!(:comment_obj) { Comment.create content: 'test content' }

  it '#new' do
    get :new, post_id: post_obj.id, response_id: response_obj.id
    expect(assigns(:comment)).to be_an_instance_of Comment
  end

  context '#create' do
    let!(:comment_params) { { content: 'test content' } }

    it 'creates a comment with valid params' do
      expect{
        post :create, post_id: post_obj.id, response_id: response_obj.id, comment: comment_params
        expect(assigns(:comment).content).to eq 'test content'
        }.to change(Comment, :count).by 1
    end

    it 'does not create a comment with invalid params' do
      expect{
        post :create, post_id: post_obj.id, response_id: response_obj.id, comment: { content: '' }
        }.to change(Comment, :count).by 0
    end

    it '#show' do
      get :show, id: comment_obj.id
      expect(assigns(:comment).content).to eq 'test content'
    end

  end
end