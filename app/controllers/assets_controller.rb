class AssetsController < ApplicationController
  before_filter :signed_in_user
  
  def create
    @asset = current_user.assets.build(params[:asset])
    if @asset.save
      flash[:success] = "Asset created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end
  
  def show
    if signed_in?
      @asset      = current_user.assets.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end