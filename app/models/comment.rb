class Comment < ActiveRecord::Base
  validates_presence_of :outfitid
  validates_presence_of :userid

  def user
    User.find(userid)
  end
end
