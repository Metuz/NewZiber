require 'test_helper'

class BreakProductsControllerTest < ActionController::TestCase
  setup do
    @break_product = break_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:break_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create break_product" do
    assert_difference('BreakProduct.count') do
      post :create, break_product: { brand_id: @break_product.brand_id, model: @break_product.model, report_id: @break_product.report_id, serial: @break_product.serial }
    end

    assert_redirected_to break_product_path(assigns(:break_product))
  end

  test "should show break_product" do
    get :show, id: @break_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @break_product
    assert_response :success
  end

  test "should update break_product" do
    patch :update, id: @break_product, break_product: { brand_id: @break_product.brand_id, model: @break_product.model, report_id: @break_product.report_id, serial: @break_product.serial }
    assert_redirected_to break_product_path(assigns(:break_product))
  end

  test "should destroy break_product" do
    assert_difference('BreakProduct.count', -1) do
      delete :destroy, id: @break_product
    end

    assert_redirected_to break_products_path
  end
end
