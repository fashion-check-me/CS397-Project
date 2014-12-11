class LandingController < ApplicationController

  def index
    @males = Outfit.order(:created_at => :desc).where(gender: "male").limit(5)
    @females = Outfit.order(:created_at => :desc).where(gender: "female").limit(5)
    @unisex = Outfit.order(:created_at => :desc).where(gender: "unisex").limit(5)

    @top_images = {"male" => @males, "female" => @females, "unisex" => @unisex}
  end
end
