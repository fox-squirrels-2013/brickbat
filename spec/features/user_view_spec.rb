require 'spec_helper'

feature 'User' do
  background do
    visit '/'
    click_on 'Login with Twitter'
  end

  scenario 'signing into Twitter' do
    expect(page).to have_content '@testuser'
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

#   scenario 'creating a post with optional parameters' do
#     click_on 'Create Post'

#     fill_in 'post[title]', :with => 'test title'
#     fill_in 'mention', :with => 'anotherperson'
#     fill_in 'hashtag', :with => 'you_suck'
#     select '1 hour', :from => 'countdown'
#     fill_in 'post[body]', :with => 'test body'
#     click_on 'Create'

#     # expect(page).to have_content 'test title'
#   end

#   # background do
#   #   click_on 'Create Post'

#   #   fill_in 'post[title]', :with => 'test title'
#   #   select '2 hours', :from => 'countdown'
#   #   fill_in 'post[body]', :with => 'test body'
#   #   click_on 'Create'
#   # end

#   # scenario 'creating a post without optional parameters' do
#   #   expect(page).to have_content 'test title'
#   # end

#   # scenario 'responding to a post', :js => true do
#   #   expect(page).to have_content 'Submit new response'
#   #   # click_on 'Submit new response'
#   # end
# end
