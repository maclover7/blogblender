require 'test_helper'

class EntryTypesControllerTest < ActionController::TestCase
  setup do
    @entry_type = entry_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry_type" do
    assert_difference('EntryType.count') do
      post :create, entry_type: { description: @entry_type.description, name: @entry_type.name, slug: @entry_type.slug }
    end

    assert_redirected_to entry_type_path(assigns(:entry_type))
  end

  test "should show entry_type" do
    get :show, id: @entry_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry_type
    assert_response :success
  end

  test "should update entry_type" do
    patch :update, id: @entry_type, entry_type: { description: @entry_type.description, name: @entry_type.name, slug: @entry_type.slug }
    assert_redirected_to entry_type_path(assigns(:entry_type))
  end

  test "should destroy entry_type" do
    assert_difference('EntryType.count', -1) do
      delete :destroy, id: @entry_type
    end

    assert_redirected_to entry_types_path
  end
end
