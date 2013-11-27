module ApplicationHelper
  def upvote
    vote_button("downvote", 1)
  end

  def downvote
    vote_button("upvote", -1)
  end

  def vote_button(name, value)
    link_to name, posts_path(:value => value), :remote => true
  end
end
