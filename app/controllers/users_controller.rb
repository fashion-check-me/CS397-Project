class UsersController < ApplicationController
  def index
    
  end

  def show
    flash.alert = "DEBUG: Showing user by username: #{params[:username]}"
    @user = User.find_by username: params[:username]
    @outfits = Outfit.where userid: @user.id
  end
end
