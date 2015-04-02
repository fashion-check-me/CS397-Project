class Tag < ActiveRecord::Base
  belongs_to :outfit

  def owned_by? user
    return (user == User.find(Outfit.find(outfitid).userid))
  end
end
