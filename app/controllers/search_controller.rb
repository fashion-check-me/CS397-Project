class SearchController < ApplicationController

  def index
  end

  def search
    args = Hash.new
    search_params.each do |k,v|
      args[k] = v unless v.empty? or k.eql? "color"
    end
    flash.notice = "Args were: #{args.inspect}"
    @result = Tag.where(args).map {|t| Outfit.find(t.outfitid)}.uniq
  end

  private
  def search_params
    params.require(:search).permit(:color, :pattern, :category, :brand)
  end
end
