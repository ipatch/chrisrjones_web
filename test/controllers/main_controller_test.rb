require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

  test "should get archive" do
    get :archive
    assert_response :success
  end

  test "should get view_post" do
    get :view_post
    assert_response :success
  end

end
