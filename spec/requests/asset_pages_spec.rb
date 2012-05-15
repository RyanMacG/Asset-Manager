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

describe "Asset pages" do
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "asset creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      
      it "should not create an asset" do
        expect { click_button "Add" }.should_not change(Asset, :count)
      end
      
      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid deets" do
      
      before { fill_in 'asset_asset_description', with: "blahblahblah" }
      before { fill_in 'asset_asset_type',        with: "Computer" }
      before { fill_in 'asset_serial_no',         with: "HERP123" }
      before { fill_in 'asset_status',            with: "Allocated" }
      before { fill_in 'asset_comment',           with: "Test comment bro"}
      
      it "should create an asset" do
        expect { click_button "Add" }.should change(Asset, :count).by(1)
      end
    end
  end
end