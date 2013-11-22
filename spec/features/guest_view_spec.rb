require 'spec_helper'

describe 'Guest features' do
  describe 'on homepage' do
    context 'guest can see posts on page' do
      it 'has default message if there are no posts' do
        visit '/'
        expect(page).to have_content 'There are no posts to display'
      end

      it 'has posts listed on the screen' do
        Post.create title: 'test title', body: 'test body'

        visit '/'
        expect(page).to have_content 'test title'
      end
    end

    context 'Guest can see login link' do  
      it 'features a Login with Twitter link in navbar' do
        visit '/'
        expect(page).to have_content 'Login with Twitter'
      end
    end
  end # end of currently working tests
end
  # describe 'can view individual posts' do
  #   before :each do
  #     @post = Post.create title: 'test title', body: 'test body'
  #     Response.create body: 'response', post_id: @post.id

  #     visit '/'
  #     click_on 'test title'
  #   end

  #   it 'can click on a link to a post' do
  #     expect(page).to have_content 'test body'
  #   end

#   #   it 'sees a login message' do
#   #     expect(page).to have_content 'Please Login with Twitter to respond to posts.'
#   #   end

#   #   it 'sees responses to posts' do
#   #     expect(page).to have_content 'response'
#   #   end
#   # end

#   # describe 'cannot create a response' do
#   #   before :each do
#   #     Post.create title: 'test title', body: 'test body'
#   #   end

#   #   it 'does not see a form to create a response' do
#   #     visit '/'

#   #     click_on 'test title'

#   #     expect(page).to_not have_content 'Submit new Response'
#   #   end
#   # end
# end