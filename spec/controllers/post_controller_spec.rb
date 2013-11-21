require 'spec_helper'

describe PostsController do

  let!(:post){ Post.create title: 'test title', body: 'test body'}

  it '#index' do
    get :index
    response.status.should eq 200
    expect(assigns(:posts)).to eq([post])
  end

end
