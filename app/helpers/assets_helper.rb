# Helper methods for assets
module AssetsHelper
  def options_for_status(_defaults)
    options_for_select(
                       [['Allocated'], ['Stock'], ['Written Off']],
                       @asset.status
                       )
  end
end
