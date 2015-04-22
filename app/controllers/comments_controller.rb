class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(safe_params)
    @comment.userid = current_user.id
    @outfit = Outfit.find(@comment.outfitid)

    begin
      @comment.save!
      redirect_to @outfit, notice: 'Comment posted.'
    rescue => e
      flash.alert = "Error posting comment. #{e}"
      render @outfit
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @outfit = Outfit.find(@comment.outfitid)
    if @comment.userid == current_user.id || current_user.is_admin?
      @comment.destroy
      flash.notice = "Comment deleted."
      redirect_to @outfit
    else
      render_401!
    end
  end

  private
  def safe_params
    params.require(:comment).permit(:outfitid, :content)
  end
end
