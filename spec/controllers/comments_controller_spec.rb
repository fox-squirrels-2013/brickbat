require 'spec_helper'

describe CommentsController do
  let!(:post_obj) { Post.create title: 'test title', body: 'test body' }
  let!(:response_obj) { Response.create body: 'test body' }

  it '#new' do
    get :new, post_id: post_obj.id, response_id: response_obj.id
    expect(assigns(:comment)).to be_an_instance_of Comment
  end

  context '#create' do
    let!(:comment_params) { { content: 'test content' } }

    it 'creates a comment with valid params' do
      # expect{
        post :create, post_id: post_obj.id, response_id: response_obj.id, comment: comment_params
        expect(assigns(:comment).content).to eq 'test content'
        # }.to change(Comment, :count)by 1
    end

  end
end