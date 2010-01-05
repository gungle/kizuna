require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logins" do
    assert_difference('Logins.count') do
      post :create, :logins => { }
    end

    assert_redirected_to logins_path(assigns(:logins))
  end

  test "should show logins" do
    get :show, :id => logins(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => logins(:one).id
    assert_response :success
  end

  test "should update logins" do
    put :update, :id => logins(:one).id, :logins => { }
    assert_redirected_to logins_path(assigns(:logins))
  end

  test "should destroy logins" do
    assert_difference('Logins.count', -1) do
      delete :destroy, :id => logins(:one).id
    end

    assert_redirected_to logins_path
  end
end
