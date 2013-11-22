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
  end
end
