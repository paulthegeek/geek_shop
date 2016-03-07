require "rails_helper"

feature "User signs in" do
  scenario "with valid email and password" do
    user = create :user
    sign_in_with(user.email, user.password)

    expect_user_to_be_signed_in
  end
end
