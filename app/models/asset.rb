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
class Asset < ActiveRecord::Base
  attr_accessible :asset_description, :asset_type, :comment, :date_purchased, :serial_no, :status, :user_id, :cost, :barcode, :image, :original_updated_at
  belongs_to :user
  validates  :user_id, presence: true
  validates  :asset_description, presence: true
  validates  :asset_type, presence: true
  validates  :serial_no, presence: true, uniqueness: true
  validates  :status, presence: true
  validates  :comment, length: { maximum: 150 }
  validate   :handle_conflict, only: :update
  
  mount_uploader :image, ImageUploader
  
  include PgSearch
  pg_search_scope :search, against: [:asset_description, :status, :asset_type, :comment, :serial_no],
      using: {tsearch: { dictionary: "english", prefix: true }},
      associated_against: { user: :name }
  
  #older assets first
  default_scope order: 'assets.created_at ASC'
  
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped 
    end
  end
  
  def original_updated_at
    @original_updated_at || updated_at.to_f
  end
  attr_writer :original_updated_at
  
  def handle_conflict
    if @conflict || updated_at.to_f > original_updated_at.to_f
      @conflict = true
      @original_updated_at = nil
      errors.add :base, "This record changed while you were editing. Take these change into account and submit it again"
      changes.each do |attribute, values|
        errors.add attribute, "was #{values.first}"
      end
    end
  end
end