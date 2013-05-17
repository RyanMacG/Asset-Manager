class AssetsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user, only: [:edit, :update, :import]

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
        pdf = AssetPdf.new(@asset)
        send_data pdf.render, filename:    "asset_#{@asset.id}.pdf",
                              type:        "application/pdf",
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
      redirect_to @asset, notice: "Profile updated"
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

  def import
    Asset.import(params[:file])
    redirect_to assets_path, notice: "Assets imported"
  end

  def last_30_days
    @assets = Asset.where("updated_at >= ?", 30.days.ago).page(params[:page]).per_page(10)
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
