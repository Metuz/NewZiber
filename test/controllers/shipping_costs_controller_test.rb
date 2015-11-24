require 'test_helper'

class ShippingCostsControllerTest < ActionController::TestCase
  setup do
    @shipping_cost = shipping_costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_cost" do
    assert_difference('ShippingCost.count') do
      post :create, shipping_cost: { company,: @shipping_cost.company,, date: @shipping_cost.date, report_id: @shipping_cost.report_id, serial,: @shipping_cost.serial, }
    end

    assert_redirected_to shipping_cost_path(assigns(:shipping_cost))
  end

  test "should show shipping_cost" do
    get :show, id: @shipping_cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_cost
    assert_response :success
  end

  test "should update shipping_cost" do
    patch :update, id: @shipping_cost, shipping_cost: { company,: @shipping_cost.company,, date: @shipping_cost.date, report_id: @shipping_cost.report_id, serial,: @shipping_cost.serial, }
    assert_redirected_to shipping_cost_path(assigns(:shipping_cost))
  end

  test "should destroy shipping_cost" do
    assert_difference('ShippingCost.count', -1) do
      delete :destroy, id: @shipping_cost
    end

    assert_redirected_to shipping_costs_path
  end
end
