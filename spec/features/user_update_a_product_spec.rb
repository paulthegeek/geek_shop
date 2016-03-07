require "rails_helper"

feature "User updates a product" do
  scenario "with name, price, short_description" do
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: "Updated Superman"
    click_button "Save"

    expect(page).to have_text "Updated Superman"
  end

  scenario "with only name and redirects to edit product page" do
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: "BvS Superman Figure Updated"
    fill_in "product_price", with: ""
    fill_in "product_short_description", with: ""
    click_button "Save"

    expect(page).to have_text "Update Product"
  end

  scenario "with only price and redirects to create product page" do
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: ""
    fill_in "product_price", with: "12.50"
    fill_in "product_short_description", with: ""
    click_button "Save"

    expect(page).to have_text "Update Product"
  end
  scenario "with only short description and redirects to create product page" do
    product = create(:product, price: "12.50")
    visit edit_product_path(product)

    fill_in "product_name", with: ""
    fill_in "product_price", with: ""
    fill_in "product_short_description", with: "This is an awesome Superman figure"
    click_button "Save"

    expect(page).to have_text "Update Product"
  end
end
