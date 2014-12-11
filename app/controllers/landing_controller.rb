class LandingController < ApplicationController

  def index
    @males = Outfit.order(:cached_votes_score => :desc).where(gender: "male").limit(5)
    @females = Outfit.order(:cached_votes_score  => :desc).where(gender: "female").limit(5)
    @unisex = Outfit.order(:cached_votes_score  => :desc).where(gender: "unisex").limit(5)

    @top_images = {"male" => @males, "female" => @females, "unisex" => @unisex}
  end
end
