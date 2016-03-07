require "rails_helper"

feature "User creates a product" do
  scenario "with name, price, short_description" do
    visit new_product_path

    fill_in "product_name", with: "BvS Superman Figure"
    fill_in "product_price", with: "12.50"
    fill_in "product_short_description", with: "This is an awesome Superman figure"
    click_button "Save"

    expect(page).to have_text "BvS Superman Figure"
  end

  scenario "with only name and redirects to create product page" do
    visit new_product_path

    fill_in "product_name", with: "BvS Superman Figure"
    click_button "Save"

    expect(page).to have_content t("products.new.new_product_title")
  end

  scenario "with only price and redirects to create product page" do
    visit new_product_path

    fill_in "product_price", with: "12.50"
    click_button "Save"

    expect(page).to have_text t("products.new.new_product_title")
  end
  scenario "with only short description and redirects to create product page" do
    visit new_product_path

    fill_in "product_short_description", with: "This is an awesome Superman figure"
    click_button "Save"

    expect(page).to have_text t("products.new.new_product_title")
  end
end
