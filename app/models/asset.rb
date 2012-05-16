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
#  comment           :string(255)
#  date_purchased    :date
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#
class Asset < ActiveRecord::Base
  attr_accessible :asset_description, :asset_type, :comment, :date_purchased, :serial_no, :status
  belongs_to :user
  validates :user_id, presence: true
  validates :asset_description, presence: true
  validates :asset_type, presence: true
  validates :serial_no, presence: true
  validates :status, presence: true
  validates :comment, length: { maximum: 150 }
  
  #older assets first
  default_scope order: 'assets.created_at ASC'
end
