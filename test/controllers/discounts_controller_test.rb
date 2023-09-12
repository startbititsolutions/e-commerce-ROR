require "test_helper"

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:one)
  end

  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_url
    assert_response :success
  end

  test "should create discount" do
    assert_difference('Discount.count') do
      post discounts_url, params: { discount: { amount: @discount.amount, code: @discount.code, customer_id: @discount.customer_id, discount_type: @discount.discount_type, end_date: @discount.end_date, min_purchase_amount: @discount.min_purchase_amount, min_purchase_quantity: @discount.min_purchase_quantity, min_use: @discount.min_use, percentage: @discount.percentage, productdetails_id: @discount.productdetails_id, start_date: @discount.start_date, status: @discount.status, title: @discount.title, used: @discount.used, vendor_id: @discount.vendor_id } }
    end

    assert_redirected_to discount_url(Discount.last)
  end

  test "should show discount" do
    get discount_url(@discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_discount_url(@discount)
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: { amount: @discount.amount, code: @discount.code, customer_id: @discount.customer_id, discount_type: @discount.discount_type, end_date: @discount.end_date, min_purchase_amount: @discount.min_purchase_amount, min_purchase_quantity: @discount.min_purchase_quantity, min_use: @discount.min_use, percentage: @discount.percentage, productdetails_id: @discount.productdetails_id, start_date: @discount.start_date, status: @discount.status, title: @discount.title, used: @discount.used, vendor_id: @discount.vendor_id } }
    assert_redirected_to discount_url(@discount)
  end

  test "should destroy discount" do
    assert_difference('Discount.count', -1) do
      delete discount_url(@discount)
    end

    assert_redirected_to discounts_url
  end
end
