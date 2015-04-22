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
    
    begin
      @takedown.save!
      redirect_to @takedown, notice: 'Request submitted.'
    rescue => e
      flash.alert = "Error creating request. #{e}"
      render action: 'new'
    end
  end

  def destroy
    
  end

  private
  def safe_params
    params.require(:takedown).permit(:url, :description, :claimant)
  end
end
