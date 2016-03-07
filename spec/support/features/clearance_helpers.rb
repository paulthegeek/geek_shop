module Features
  module ClearanceHelpers
    def sign_in
      user = create(:user)
      sign_in_with user.email, user.password
    end

    def sign_in_with(email, password)
      visit sign_in_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_button t("helpers.submit.session.submit")
    end

    def sign_out
      click_button t("layouts.application.sign_out")
    end

    def sign_up
      click_button t("layouts.appliction.sign_up")
    end

    def sign_up_with(user)
      visit sign_up_path

      fill_in "user_email", with: user.email
      fill_in "user_first_name", with: user.first_name
      fill_in "user_last_name", with: user.last_name
      fill_in "user_password", with: user.password
      click_button t("helpers.submit.user.create")
    end

    def expect_user_to_be_signed_in
      visit root_path
      expect(page).to have_button t("layouts.application.sign_out")
      expect(page).to have_content t("homes.show.home_welcome")
    end

    def expect_user_to_be_signed_out
      expect(page).to have_button t("layouts.application.sign_in")
    end

    def expect_user_to_be_on_sign_up
      expect(page).to have_button t("helpers.submit.user.create")
    end

    def expect_user_to_be_on_home_page
      expect(page).to have_content t("homes.show.home_welcome")
    end
  end
end
