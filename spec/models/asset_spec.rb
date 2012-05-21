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
                                      serial_no: "01TEST", status: "allocated") }
  
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
  
  describe "filling in fields" do
    describe "with blank description" do
      before { @asset.asset_description = " " }
      it { should_not be_valid }
    end
    
    describe "with blanks status" do
      before { @asset.status = " " }
      it { should_not be_valid }
    end
    
    describe "blank type" do
      before { @asset.asset_type = " " }
      it { should_not be_valid }
    end
    
    describe "Serial numbers" do
      
      describe "when serial number is already taken" do
        before do
          asset_with_same_serial = @asset.dup
          asset_with_same_serial.save
        end
     
        it { should_not be_valid }
      end
      
      
      describe "blank serial number" do
        before { @asset.serial_no = " " }
        it { should_not be_valid }
      end
      
    end
    
    describe "too long a comment" do
      before { @asset.comment = "a" * 151 }
      it { should_not be_valid }
    end
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Asset.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end# == Schema Information
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

