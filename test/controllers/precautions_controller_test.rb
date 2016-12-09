require 'test_helper'

class PrecautionsControllerTest < ActionController::TestCase
  setup do
    @precaution = precautions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:precautions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create precaution" do
    assert_difference('Precaution.count') do
      post :create, precaution: { details: @precaution.details, name: @precaution.name }
    end

    assert_redirected_to precaution_path(assigns(:precaution))
  end

  test "should show precaution" do
    get :show, id: @precaution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @precaution
    assert_response :success
  end

  test "should update precaution" do
    patch :update, id: @precaution, precaution: { details: @precaution.details, name: @precaution.name }
    assert_redirected_to precaution_path(assigns(:precaution))
  end

  test "should destroy precaution" do
    assert_difference('Precaution.count', -1) do
      delete :destroy, id: @precaution
    end

    assert_redirected_to precautions_path
  end
end
