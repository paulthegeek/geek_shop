require "rails_helper"

feature "Admin updates a product" do
  scenario "with name, price, short_description" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: "Updated Superman"
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.index.product_title")
  end

  scenario "with only name and redirects to edit product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: "BvS Superman Figure Updated"
    fill_in "product_price", with: ""
    fill_in "product_short_description", with: ""
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.edit.update_product_title")
  end

  scenario "with only price and redirects to create product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: ""
    fill_in "product_price", with: "12.50"
    fill_in "product_short_description", with: ""
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.edit.update_product_title")
  end
  scenario "with only short description and redirects to create product page" do
    user = create(:user, role: :admin)
    sign_in_with user.email, user.password
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: ""
    fill_in "product_price", with: ""
    fill_in "product_short_description", with: "Awesome Superman figure"
    click_button t("products.form.submit_product")

    expect(page).to have_text t("products.edit.update_product_title")
  end
end
