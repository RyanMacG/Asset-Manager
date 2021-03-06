require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }
    let(:page_title) { user.name }
    let(:heading) { user.name }
    
    it_should_behave_like "all pages"
    
    it { should have_link('Users',    href: users_path) }
    it { should have_link('Me',       href: user_path(user)) }
    it { should have_link('Settings', href: edit_user_path(user)) }
    it { should have_link('Sign out', href: signout_path) }
    
    it { should_not have_link('Sign in', href: signin_path) }
  end
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid info" do
      before { click_button "Sign in" }
      let(:page_title) { 'Sign in' }
      let(:heading) { 'Sign in' }
      
      it_should_behave_like "all pages"
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe "after visiting another page" do
        before { click_link ENV['comp_logo'] }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
  end
  
  describe "authorization" do
      
    describe "for non-signed-in peeps" do
      let(:user) { FactoryGirl.create(:user) }
        
      describe "in the Users controller" do
          
        describe "visiting the edit page" do
          before  { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign in') }
        end
        
        describe "visiting the user index" do
          before { visit users_path }
          it { should have_selector('title', text: 'Sign in') }
        end
        
        describe "submitting to the update action" do
          #put is just an alternative to the capybara visit method that issues a PUT request directly
          before  { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
        
        describe "when attempting to visit a protected page" do
          before do
            visit edit_user_path(user)
            fill_in "Email",    with: user.email
            fill_in "Password", with: user.password
            click_button "Sign in"
          end
          
          describe "after signing in" do
            it "should render the protected page" do
              page.should have_selector('title', text: 'Edit user')
            end
          end
        end
      end
      
      describe "in the assets controller" do
        
        describe "submitting to the create action" do
          before { post assets_path }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }
      
      describe "visiting edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end
      
      describe "submitting a request to the update action" do
        before  { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
    
    describe "as non-admin" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }
      
      before { sign_in non_admin }
      
      describe "submitting a delete request" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end