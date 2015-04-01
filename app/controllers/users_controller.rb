class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find_by! username: params[:username]
    @outfits = Outfit.where userid: @user.id
  end
end
