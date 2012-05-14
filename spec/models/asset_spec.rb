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
require 'spec_helper'

describe Asset do
  let(:user) { FactoryGirl.create(:user) }
  before { @asset = user.assets.build(asset_description: "Lorem ipsum", asset_type: "Mobile",
                                      serial_no: "01TEST") }
  
  subject { @asset }
  
  #check everything is there
  it { should respond_to(:asset_description) }
  it { should respond_to(:asset_type) }
  it { should respond_to(:serial_no) }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  it { should respond_to(:date_purchased) }
  it { should respond_to(:comment) }
  it { should respond_to(:status) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @asset.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Asset.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end