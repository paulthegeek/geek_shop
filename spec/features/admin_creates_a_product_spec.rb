require "rails_helper"

feature "Admin creates a product" do
  scenario "with name, price, short_description" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    visit new_product_path

    fill_in "product_name", with: "BvS Superman Figure"
    fill_in "product_price", with: "12.50"
    fill_in "product_short_description", with: "Awesome Superman figure"
    click_button t("products.form.submit_product")

    expect(page).to have_text "BvS Superman Figure"
  end

  scenario "with only name and redirects to create product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    visit new_product_path

    fill_in "product_name", with: "BvS Superman Figure"
    click_button t("products.form.submit_product")

    expect(page).to have_content t("products.new.new_product_title")
  end

  scenario "with only price and redirects to create product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    visit new_product_path

    fill_in "product_price", with: "12.50"
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.new.new_product_title")
  end
  scenario "with only short description and redirects to create product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    visit new_product_path

    fill_in "product_short_description", with: "Awesome Superman figure"
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.new.new_product_title")
  end
end
