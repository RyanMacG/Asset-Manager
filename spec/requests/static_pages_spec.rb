require 'spec_helper'

describe "Static Pages" do
	
	describe "Home page" do
		it "should have the content 'Asset Manager'" do
			visit '/static_pages/home'
			page.should have_content('Asset Manager')
		end
    
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Asset Manager | Home")
    end
	end

	describe "Help page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			page.should have_content('Help')
		end
    
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Asset Manager | Help")
    end
	end

	describe "About page" do
		it "should have the content 'About the app" do
			visit '/static_pages/about'
			page.should have_content('About')
		end
    
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Asset Manager | About")
    end
	end
end