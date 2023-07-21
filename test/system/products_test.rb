require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "List price", with: @product.list_price
    fill_in "Meta description", with: @product.meta_description
    fill_in "Meta title", with: @product.meta_title
    fill_in "Price", with: @product.price
    fill_in "Product title", with: @product.product_title
    fill_in "Product type", with: @product.product_type
    fill_in "Sku", with: @product.sku
    check "Status" if @product.status
    fill_in "Tags", with: @product.tags
    fill_in "Vendor", with: @product.vendor_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @product.brand
    fill_in "Description", with: @product.description
    fill_in "List price", with: @product.list_price
    fill_in "Meta description", with: @product.meta_description
    fill_in "Meta title", with: @product.meta_title
    fill_in "Price", with: @product.price
    fill_in "Product title", with: @product.product_title
    fill_in "Product type", with: @product.product_type
    fill_in "Sku", with: @product.sku
    check "Status" if @product.status
    fill_in "Tags", with: @product.tags
    fill_in "Vendor", with: @product.vendor_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
