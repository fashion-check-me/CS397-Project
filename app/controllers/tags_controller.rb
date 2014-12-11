class TagsController < ApplicationController
  def new
    @outfitid = params[:outfitid]
    if @outfitid.nil?
      redirect_to outfits_path, alert: "If you want to add a tag, go to the outfit's page and click \"Add Tag\""
    end
  end

  def create
    @tag = Tag.new(tag_params)

    outfit = Outfit.find(@tag.outfitid)
    if (outfit.userid != current_user.id)
      flash.alert = "You are not the owner of this outfit."
      redirect_to outfit
    elsif @tag.save
      redirect_to Outfit.find(@tag.outfitid), notice: "Tag added."
    else
      render action: 'new', alert: "Error creating tag."
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:outfitid, :pattern, :category, :brand, :color)
  end
end
