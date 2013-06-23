module AssetsHelper

  def options_for_status(defaults)
    options_for_select([["Allocated"], ["Stock"], ["Written Off"]], @asset.status)
  end
end