module OutfitsHelper

  def outfit_upvote_state(outfit)
    return 'upvoted' if current_user.liked? outfit
    'upvote'
  end

  def outfit_downvote_state(outfit)
    return 'downvoted' if current_user.disliked? outfit
    'downvote'
  end

  def outfit_upvote_link(outfit)
    link_to image_tag(outfit_upvote_state(outfit).to_s + '.png'), outfit_vote_up_path(outfit), method: :put, remote: true
  end

  def outfit_downvote_link(outfit)
    link_to image_tag(outfit_downvote_state(outfit).to_s + '.png'), outfit_vote_down_path(outfit), method: :put, remote: true
  end 

end
