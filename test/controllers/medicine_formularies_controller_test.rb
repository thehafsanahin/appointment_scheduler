require 'test_helper'

class MedicineFormulariesControllerTest < ActionController::TestCase
  setup do
    @medicine_formulary = medicine_formularies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicine_formularies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine_formulary" do
    assert_difference('MedicineFormulary.count') do
      post :create, medicine_formulary: { brand_name: @medicine_formulary.brand_name, name: @medicine_formulary.name, price: @medicine_formulary.price, uses: @medicine_formulary.uses }
    end

    assert_redirected_to medicine_formulary_path(assigns(:medicine_formulary))
  end

  test "should show medicine_formulary" do
    get :show, id: @medicine_formulary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine_formulary
    assert_response :success
  end

  test "should update medicine_formulary" do
    patch :update, id: @medicine_formulary, medicine_formulary: { brand_name: @medicine_formulary.brand_name, name: @medicine_formulary.name, price: @medicine_formulary.price, uses: @medicine_formulary.uses }
    assert_redirected_to medicine_formulary_path(assigns(:medicine_formulary))
  end

  test "should destroy medicine_formulary" do
    assert_difference('MedicineFormulary.count', -1) do
      delete :destroy, id: @medicine_formulary
    end

    assert_redirected_to medicine_formularies_path
  end
end
