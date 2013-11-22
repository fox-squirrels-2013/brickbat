module ApplicationHelper

  def username(post)
    post.user.username
  end

  def twit_link(username)
    'https://twitter.com/' + username
  end
  
end
