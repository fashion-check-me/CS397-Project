class OutfitsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.userid = current_user.id

    if @outfit.save
      redirect_to @outfit, notice: 'Outfit was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :name, :description, :gender)
  end
end
