class Tag < ActiveRecord::Base
  def owned_by? user
    return (user == User.find(Outfit.find(outfitid).userid))
  end
end
