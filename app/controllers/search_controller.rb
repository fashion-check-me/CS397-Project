class SearchController < ApplicationController

  def index
  end

  def search
    args = Hash.new
    @prms = search_params.inspect
    search_params.each do |k,v|
      args[k] = v unless v.empty? or k.eql? "color"
    end
    
    @result = Tag.find_by args
    @result = [] if @result.nil?
  end

  private
  def search_params
    params.require(:search).permit(:color, :pattern, :category, :brand)
  end
end
