# == Schema Information
#
# Table name: assets
#
#  id                :integer         not null, primary key
#  asset_description :string(255)
#  asset_type        :string(255)
#  status            :string(255)
#  serial_no         :string(255)
#  user_id           :integer
#  cost              :decimal(, )
#  barcode           :string(255)
#  comment           :string(255)
#  date_purchased    :date
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#
class AssetPdf
  def initialize(asset)
    @asset  = asset
    @pdf = Prawn::Document.new
    blank_line
    blank_line
    asset_intro
    blank_line
    asset_user
    purchase_deets
    blank_line
    image_blurb
    image
    render
  end
  
  def asset_intro
    @pdf.text "Asset - #{ENV['asset_pre']}#{@asset.id} | #{@asset.asset_description} #{@asset.asset_type}", size: 18, style: :bold
  end
  
  def asset_user
    @pdf.text "This asset is assigned to #{@asset.user.name} and was last changed at #{@asset.updated_at.strftime('%d-%m-%Y-%H:%M')}"
  end
  
  def purchase_deets
    @pdf.text "It was purchased for #{ENV['currency']}(#{@asset.cost}) on #{@asset.date_purchased}"
  end
  
  def comment
    @pdf.text "The following issues/comments have been recorded #{@asset.comment}"
  end
  
  def serial
    @pdf.text "For reference the Serial No/IMEI is #{@asset.serial_no}"
  end
  
  def blank_line
    @pdf.text " "
  end
  
  def image_blurb
    if @asset.image?
      @pdf.text "The following image has been attached"
    else
      @pdf.text "No image has been uploaded for this asset"
    end
  end
  
  def image
    if @asset.image?
      @pdf.image open("public#{@asset.image.url.to_s}")
    end
  end
  
  def render
    @pdf.render
  end
end