require "application_system_test_case"

class ProductdetailsTest < ApplicationSystemTestCase
  setup do
    @productdetail = productdetails(:one)
  end

  test "visiting the index" do
    visit productdetails_url
    assert_selector "h1", text: "Productdetails"
  end

  test "creating a Productdetail" do
    visit productdetails_url
    click_on "New Productdetail"

    fill_in "Brand", with: @productdetail.brand
    fill_in "Description", with: @productdetail.description
    fill_in "List price", with: @productdetail.list_price
    fill_in "Meta description", with: @productdetail.meta_description
    fill_in "Meta title", with: @productdetail.meta_title
    fill_in "Price", with: @productdetail.price
    fill_in "Product title", with: @productdetail.product_title
    fill_in "Product type", with: @productdetail.product_type
    fill_in "Sku", with: @productdetail.sku
    check "Status" if @productdetail.status
    fill_in "Tags", with: @productdetail.tags
    fill_in "Vendor", with: @productdetail.vendor_id
    click_on "Create Productdetail"

    assert_text "Productdetail was successfully created"
    click_on "Back"
  end

  test "updating a Productdetail" do
    visit productdetails_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @productdetail.brand
    fill_in "Description", with: @productdetail.description
    fill_in "List price", with: @productdetail.list_price
    fill_in "Meta description", with: @productdetail.meta_description
    fill_in "Meta title", with: @productdetail.meta_title
    fill_in "Price", with: @productdetail.price
    fill_in "Product title", with: @productdetail.product_title
    fill_in "Product type", with: @productdetail.product_type
    fill_in "Sku", with: @productdetail.sku
    check "Status" if @productdetail.status
    fill_in "Tags", with: @productdetail.tags
    fill_in "Vendor", with: @productdetail.vendor_id
    click_on "Update Productdetail"

    assert_text "Productdetail was successfully updated"
    click_on "Back"
  end

  test "destroying a Productdetail" do
    visit productdetails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Productdetail was successfully destroyed"
  end
end
