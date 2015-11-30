require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { text10: @page.text10, text1: @page.text1, text2: @page.text2, text3: @page.text3, text4: @page.text4, text5: @page.text5, text6: @page.text6, text7: @page.text7, text8: @page.text8, text9: @page.text9 }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    patch :update, id: @page, page: { text10: @page.text10, text1: @page.text1, text2: @page.text2, text3: @page.text3, text4: @page.text4, text5: @page.text5, text6: @page.text6, text7: @page.text7, text8: @page.text8, text9: @page.text9 }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
