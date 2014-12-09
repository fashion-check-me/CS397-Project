class OutfitsController < ApplicationController

  def index
      @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.userid = 1
    if @outfit.save
      redirect_to @outfit, notice: 'Outfit was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :title, :description)
  end
end
