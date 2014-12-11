module OutfitsHelper

  def outfit_upvote_css(outfit)
    return 'upvoted' if current_user.liked? outfit
    'upvote'
  end

  def outfit_downvote_css(outfit)
    return 'downvoted' if current_user.disliked? outfit
    'downvote'
  end

end
