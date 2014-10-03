require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  setup do
    @community = communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community" do
    assert_difference('Community.count') do
      post :create, community: { domain: @community.domain, facebook_url: @community.facebook_url, name: @community.name, twitter_name: @community.twitter_name }
    end

    assert_redirected_to community_path(assigns(:community))
  end

  test "should show community" do
    get :show, id: @community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community
    assert_response :success
  end

  test "should update community" do
    patch :update, id: @community, community: { domain: @community.domain, facebook_url: @community.facebook_url, name: @community.name, twitter_name: @community.twitter_name }
    assert_redirected_to community_path(assigns(:community))
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete :destroy, id: @community
    end

    assert_redirected_to communities_path
  end
end
