class OutfitsController < ApplicationController

  def index
      @outfits = Outfit.all
  end

  def show
  end

  def create
    @outfit = Outfit.new(outfit_params)

    if @outfit.save
      redirect_to @outfit, notice: 'Outfit was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  def outfit_params
    params.require(:outfit).permit(:image, :name)
  end
end
