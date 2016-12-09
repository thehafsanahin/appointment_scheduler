require 'test_helper'

class SideEffectsControllerTest < ActionController::TestCase
  setup do
    @side_effect = side_effects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:side_effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create side_effect" do
    assert_difference('SideEffect.count') do
      post :create, side_effect: { description: @side_effect.description, name: @side_effect.name }
    end

    assert_redirected_to side_effect_path(assigns(:side_effect))
  end

  test "should show side_effect" do
    get :show, id: @side_effect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @side_effect
    assert_response :success
  end

  test "should update side_effect" do
    patch :update, id: @side_effect, side_effect: { description: @side_effect.description, name: @side_effect.name }
    assert_redirected_to side_effect_path(assigns(:side_effect))
  end

  test "should destroy side_effect" do
    assert_difference('SideEffect.count', -1) do
      delete :destroy, id: @side_effect
    end

    assert_redirected_to side_effects_path
  end
end
