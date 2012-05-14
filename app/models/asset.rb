class Asset < ActiveRecord::Base
  attr_accessible :asset_description, :asset_type, :comment, :date_purchased, :serial_no, :user_id
end
