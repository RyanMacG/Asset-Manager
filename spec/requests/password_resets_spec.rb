require 'spec_helper'

describe "PasswordResets" do
  it "emails user when password reset is requested" do
    user = Factory(:user)
    visit signin_path
    click_link "Forgotten your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    page.should have_content("Email sent")
  end
end