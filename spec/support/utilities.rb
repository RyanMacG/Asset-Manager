include ApplicationHelper

shared_examples_for "all pages" do
  it { should have_selector('h1', text: heading) }
  it { should have_selector('title', text: full_title(page_title)) }
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  #Sign in even when we don't use capybara for testing
  cookies[:remember_token] = user.remember_token
end