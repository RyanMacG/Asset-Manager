#This project is designed from a Test Driven Development methodology, for this to work I write tests
#for the features to be implemented and then make sure they fail. Then I write appropriate code to make
#them pass. This can focus on making sure layouts render correctly or be used to ensure users are functioning
#as intended.
require 'spec_helper'

describe "Static Pages" do
   
   subject { page }
   
  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Asset Manager' }
    let(:page_title) { '' }
    
    it_should_behave_like "all pages"
    it { should_not have_selector('title', text: 'Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like "all pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all pages"
  end
   
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
  end
end