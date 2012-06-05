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
class AssetPdf <  Prawn::Document
  def initialize(asset)
    super()
    @asset  = asset
    asset_intro
    blank_line
    asset_user
    purchase_deets
  end
  
  def asset_intro
    text "Asset - JTC#{@asset.id} | #{@asset.asset_description}", size: 18, style: :bold
  end
  
  def asset_user
    text "This asset is assigned to #{@asset.user.name} and was last changed at #{@asset.updated_at}"
  end
  
  def purchase_deets
    text "It was purchased for GBP(#{@asset.cost}) on #{@asset.date_purchased}"
  end
  
  def blank_line
    text " "
  end
end