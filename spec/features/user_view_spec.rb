require 'spec_helper'

feature 'User' do
  background do
    visit '/'
    click_on 'Login with Twitter'
  end

  scenario 'signing into Twitter' do
    expect(page).to have_content 'testuser'
  end

  scenario 'can see the form to create a post' do
    click_on 'Create Post'
    expect(page).to have_content 'Create a New Post'
  end

  scenario 'can log out' do
    visit '/'
    click_on 'Log out'

    expect(page).to have_content 'Login with Twitter'
  end
end
