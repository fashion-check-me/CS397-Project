class UsersController < ApplicationController
  def index
    
  end

  def show
    flash.alert = "DEBUG: Showing user by username: #{params[:username]}"
  end
end
