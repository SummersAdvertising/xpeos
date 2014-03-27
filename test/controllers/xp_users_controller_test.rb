require 'test_helper'

class XpUsersControllerTest < ActionController::TestCase
  setup do
    @xp_user = xp_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xp_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xp_user" do
    assert_difference('XpUser.count') do
      post :create, xp_user: { access_token: @xp_user.access_token, address: @xp_user.address, email: @xp_user.email, fb_share_id: @xp_user.fb_share_id, fb_user_id: @xp_user.fb_user_id, name: @xp_user.name, phone: @xp_user.phone }
    end

    assert_redirected_to xp_user_path(assigns(:xp_user))
  end

  test "should show xp_user" do
    get :show, id: @xp_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xp_user
    assert_response :success
  end

  test "should update xp_user" do
    patch :update, id: @xp_user, xp_user: { access_token: @xp_user.access_token, address: @xp_user.address, email: @xp_user.email, fb_share_id: @xp_user.fb_share_id, fb_user_id: @xp_user.fb_user_id, name: @xp_user.name, phone: @xp_user.phone }
    assert_redirected_to xp_user_path(assigns(:xp_user))
  end

  test "should destroy xp_user" do
    assert_difference('XpUser.count', -1) do
      delete :destroy, id: @xp_user
    end

    assert_redirected_to xp_users_path
  end
end
