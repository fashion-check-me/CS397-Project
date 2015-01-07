class OutfitsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :vote_up, :vote_down, :vote_undo, :destroy]

  def index
    @outfits = Outfit.order(created_at: :desc)  # Newest first
  end

  def show
    @outfit = Outfit.find(params[:id])
    @owner = User.find(@outfit.userid)
    @tags = Tag.where(outfitid: @outfit.id)
    @user_is_owner = user_signed_in? && @owner.id == current_user.id
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.userid = current_user.id

    
    begin
      @outfit.save!
      redirect_to @outfit, notice: 'Outfit was successfully created.'
    rescue => e
      flash.alert = "Error creating outfit. #{e}"
      render action: 'new'
    end
  end

  def vote_up
    @outfit = Outfit.find(params[:id])

    if current_user.liked? @outfit
      @outfit.unliked_by current_user
    else
      @outfit.liked_by current_user
    end

    redirect_to @outfit
  end

  def vote_down
    @outfit = Outfit.find(params[:id])

    if current_user.disliked? @outfit
      @outfit.undisliked_by current_user
    else
      @outfit.disliked_by current_user
    end
    redirect_to @outfit
  end

  def destroy
    @outfit = Outfit.find(params[:id])

    if current_user.id == @outfit.userid
      @outfit.destroy
      redirect_to outfits_path
    else
      render :file => "public/401", :status => :unauthorized
    end
  end

  private
  def outfit_params
    params.require(:outfit).permit(:gender, :image, :name, :description)
  end
end
