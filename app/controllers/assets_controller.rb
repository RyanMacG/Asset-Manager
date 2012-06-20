class AssetsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:edit, :update]
  
  def create
    @asset = current_user.assets.build(params[:asset])
    if @asset.save
      redirect_to root_path
      flash.now[:success] = "Asset created!"
    else
      render 'static_pages/home'
    end
  end
  
  def show
    @asset = Asset.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        @asset_pdf  = Asset.find(params[:id])
        pdf = AssetPdf.new(@asset_pdf)
        send_data pdf.render, filename: "asset_#{@asset_pdf.id}.pdf",
                                        type: "application/pdf",
                                        disposition: "inline"
      end
    end
  end
  
  def edit
    @asset = Asset.find(params[:id])
  end
  
  def update
    @asset = Asset.find(params[:id])
    if @asset.update_attributes(params[:asset])
      flash[:notice] = "Profile updated"
      redirect_to @asset
    else
      render 'edit'
    end
  end
  
  def search
    @assets = Asset.text_search(params[:query]).page(params[:page]).per_page(10)
  end
  
  def index
    @assets = Asset.includes(:user).paginate(page: params[:page])
  end
  
  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end