class SearchController < ApplicationController

  def index
  end

  def search
    args = Hash.new
    # search_params is not a vanilla Hash, so we need to convert it to one
    search_params.each do |k,v|
      args[k] = v unless v.empty? # this removes both :search and any unused search params
    end
    @result = Tag.where(args).map {|t| Outfit.find(t.outfitid)}.uniq
  end

  private
  def search_params
    params.require(:search).permit(:color, :pattern, :category, :brand)
  end
end
