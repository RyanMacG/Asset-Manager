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
  
  describe "show page" do
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        FactoryGirl.create(:asset, user: user)
        FactoryGirl.create(:asset, user: user)
        sign_in user
        visit '/assets/show'
      end
      
      it "should render the user feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.asset_description)
        end
      end
    end
  end
  
  describe "edit page" do
    let(:user) { FactoryGirl.create(:admin) }
    let(:asset) { FactoryGirl.create(:asset) }
    before do
      sign_in user
      visit edit_asset_path(asset)
    end
    
    describe "page" do
      it { should have_selector('h1',     text: "Update the asset") }
      it { should have_selector('title',  text: "Edit Asset") }
    end
    
    describe "with invalid info" do
      before { fill_in 'asset_asset_description', with: " " }
      before { click_button "Save changes" }
      
      it { should have_content('error') }
    end
    
    describe "with valid info" do
			before { fill_in 'asset_asset_description', with: "Valid Info" }
			before { click_button "Save changes" }
			
			it { should have_selector('title', text: 'Assets') }
    end
  end
  
  describe "search page" do
    let(:user) { FactoryGirl.create(:user) }
    let(:asset) { FactoryGirl.create(:asset) }
    before do
      sign_in user
      visit search_path
    end
  end
end