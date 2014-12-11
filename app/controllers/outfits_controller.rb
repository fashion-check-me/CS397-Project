class OutfitsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :vote_up, :vote_down, :vote_undo]

  def index
    @outfits = Outfit.order(created_at: :desc)  # Newest first
  end

  def show
    @outfit = Outfit.find(params[:id])
    @user = User.find(@outfit.userid)
    @tags = Tag.where(outfitid: @outfit.id)
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.userid = current_user.id

    
    begin
    @outfit.save!
      redirect_to @outfit, notice: outfit_params[:gender] #'Outfit was successfully created.'
    rescue => e
      flash.alert = "Error creating outfit. #{e}"
      render action: 'new'
    end
  end

  def vote_up
    @outfit = Outfit.find(params[:id])
    @outfit.liked_by current_user
  end

  def vote_down
    @outfit = Outfit.find(params[:id])
    @outfit.disliked_by current_user
  end

  def vote_undo
    @outfit = Outfit.find(params[:id])

    if current_user.liked? @outfit
      @outfit.unliked_by current_user
    else
      @outfit.undisliked_by current_user
    end
  end

  private
  def outfit_params
    params.require(:outfit).permit(:gender, :image, :name, :description)
  end
end
