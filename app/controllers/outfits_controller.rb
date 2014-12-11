class OutfitsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :vote_up, :vote_down, :vote_undo]

  def index
    @outfits = Outfit.order(created_at: :desc)  # Newest first
  end

  def show
    @outfit = Outfit.find(params[:id])
    @user = User.find(@outfit.userid)
    @tags = Tag.find_by(outfitid: @outfit.id)
    if @tags.nil?
      @tags = []
    elsif @tags.instance_of? Tag
      @tags = [@tags]
    end
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.userid = current_user.id

    if @outfit.save
      redirect_to @outfit, notice: 'Outfit was successfully created.'
    else
      flash.alert = "Error creating outfit. You get to guess what the error was."
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
    params.require(:outfit).permit(:image, :name, :description, :gender)
  end
end
