class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def reported
    @reported_outfits = Outfit.where(reported: true)
  end

  def unflag
    @outfit = Outfit.find params[:id]
    @outfit.update reported: false
    redirect_to review_reported_path
  end
end
