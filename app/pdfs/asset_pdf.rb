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
    asset_intro
    blank_line
    asset_user
    purchase_deets
    blank_line
    render
  end
  
  def asset_intro
    @pdf.text "Asset - JTC#{@asset.id} | #{@asset.asset_description} #{@asset.asset_type}", size: 18, style: :bold
  end
  
  def asset_user
    @pdf.text "This asset is assigned to #{@asset.user.name} and was last changed at #{@asset.updated_at}"
  end
  
  def purchase_deets
    @pdf.text "It was purchased for GBP(#{@asset.cost}) on #{@asset.date_purchased}"
  end
  
  def comment
    @pdf.text "The following issues/comments have been recorded #{@asset.comment}"
  end
  
  def serial
    @pdf.text "For reference the Serial No/IMEI is"
  end
  
  def blank_line
    @pdf.text " "
  end
  
  def render
    @pdf.render
  end
end