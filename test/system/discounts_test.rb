require "application_system_test_case"

class DiscountsTest < ApplicationSystemTestCase
  setup do
    @discount = discounts(:one)
  end

  test "visiting the index" do
    visit discounts_url
    assert_selector "h1", text: "Discounts"
  end

  test "creating a Discount" do
    visit discounts_url
    click_on "New Discount"

    fill_in "Amount", with: @discount.amount
    fill_in "Code", with: @discount.code
    fill_in "Customer", with: @discount.customer_id
    fill_in "Discount type", with: @discount.discount_type
    fill_in "End date", with: @discount.end_date
    fill_in "Min purchase amount", with: @discount.min_purchase_amount
    fill_in "Min purchase quantity", with: @discount.min_purchase_quantity
    fill_in "Min use", with: @discount.min_use
    fill_in "Percentage", with: @discount.percentage
    fill_in "Productdetails", with: @discount.productdetails_id
    fill_in "Start date", with: @discount.start_date
    check "Status" if @discount.status
    fill_in "Title", with: @discount.title
    fill_in "Used", with: @discount.used
    fill_in "Vendor", with: @discount.vendor_id
    click_on "Create Discount"

    assert_text "Discount was successfully created"
    click_on "Back"
  end

  test "updating a Discount" do
    visit discounts_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @discount.amount
    fill_in "Code", with: @discount.code
    fill_in "Customer", with: @discount.customer_id
    fill_in "Discount type", with: @discount.discount_type
    fill_in "End date", with: @discount.end_date
    fill_in "Min purchase amount", with: @discount.min_purchase_amount
    fill_in "Min purchase quantity", with: @discount.min_purchase_quantity
    fill_in "Min use", with: @discount.min_use
    fill_in "Percentage", with: @discount.percentage
    fill_in "Productdetails", with: @discount.productdetails_id
    fill_in "Start date", with: @discount.start_date
    check "Status" if @discount.status
    fill_in "Title", with: @discount.title
    fill_in "Used", with: @discount.used
    fill_in "Vendor", with: @discount.vendor_id
    click_on "Update Discount"

    assert_text "Discount was successfully updated"
    click_on "Back"
  end

  test "destroying a Discount" do
    visit discounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discount was successfully destroyed"
  end
end
