#This project is designed from a Test Driven Development methodology, for this to work I write tests
#for the features to be implemented and then make sure they fail. Then I write appropriate code to make
#them pass. This can focus on making sure layouts render correctly or be used to ensure users are functioning
#as intended.
require 'spec_helper'

describe "Static Pages" do
   
   subject { page }
	
	describe "Home page" do
      before { visit root_path }
      
      it { should have_selector('h1', text: 'Asset Manager') }
      it { should have_selector('title', text: full_title('')) }
	end

	describe "Help page" do
      before { visit help_path }
      
      it { should have_selector('h1', text: 'Help') }
      it { should have_selector('title', text: full_title('')) }
   end

	describe "About page" do
      before { visit about_path }
      
      it { should have_selector('h1', text: 'About') }
      it { should have_selector('title', text: full_title('')) }
	end
   
   it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About')
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Home"
      page.should have_selector 'title', text: full_title('Home')
   end
end