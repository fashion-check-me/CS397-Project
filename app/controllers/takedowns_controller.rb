class TakedownsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :new, :create]
  before_action :require_admin!, :except => [:index, :show, :new, :create]
  def index
    @takedowns = Takedown.all
  end

  def show
    @takedown = Takedown.find params[:id]
  end

  def new
    
  end

  def create
    @takedown = Takedown.new(safe_params)
 
    @takedown.save
    redirect_to @takedown
  end

  def destroy
    
  end

  private
  def safe_params
    params.require(:takedown).permit(:url, :description, :claimant)
  end

  def require_admin!
    unless current_user.is_admin?
      render :file => "public/401", :status => :unauthorized
    end
  end
end
