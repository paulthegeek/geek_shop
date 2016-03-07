require "rails_helper"
require "clearance/rspec"

feature "User signs up" do
  scenario "by navigating to the page" do
    visit sign_in_path

    click_link t("sessions.form.sign_up")

    expect_user_to_be_on_sign_up
  end

  scenario "with a valid email, first/last name, and password" do
    user = build(:user)
    sign_up_with user

    expect_user_to_be_on_home_page
  end

  scenario "tries with invalid email" do
    user_with_no_email = build(:user, email: "invalid_email")
    sign_up_with user_with_no_email

    expect_user_to_be_on_sign_up
  end

  scenario "tries with blank password" do
    user_with_no_password = build(:user, password: "")
    sign_up_with user_with_no_password

    expect_user_to_be_on_sign_up
  end
end
