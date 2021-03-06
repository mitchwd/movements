require 'test_helper'

class IdentifiersControllerTest < ActionController::TestCase
  setup do
    @identifier = identifiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identifiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identifier" do
    assert_difference('Identifier.count') do
      post :create, identifier: { code: @identifier.code, person_id: @identifier.person_id }
    end

    assert_redirected_to identifier_path(assigns(:identifier))
  end

  test "should show identifier" do
    get :show, id: @identifier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @identifier
    assert_response :success
  end

  test "should update identifier" do
    patch :update, id: @identifier, identifier: { code: @identifier.code, person_id: @identifier.person_id }
    assert_redirected_to identifier_path(assigns(:identifier))
  end

  test "should destroy identifier" do
    assert_difference('Identifier.count', -1) do
      delete :destroy, id: @identifier
    end

    assert_redirected_to identifiers_path
  end
end
