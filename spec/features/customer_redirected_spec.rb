require "rails_helper"

feature "Customer is redirected" do
  scenario "when navigating to a page with unsufficent permissions" do
    user = create(:user, role: :customer)
    sign_in_with user.email, user.password
    visit products_path

    expect(page).to have_text t("homes.show.home_welcome")
  end

  scenario "when navigating to a page unauthenticated" do
    visit products_path

    expect(page).to have_text t("homes.show.home_welcome")
  end
end
