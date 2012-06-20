class AddImageToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :image, :string
  end
end
