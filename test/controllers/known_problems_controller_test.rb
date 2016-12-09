require 'test_helper'

class KnownProblemsControllerTest < ActionController::TestCase
  setup do
    @known_problem = known_problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:known_problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create known_problem" do
    assert_difference('KnownProblem.count') do
      post :create, known_problem: {  }
    end

    assert_redirected_to known_problem_path(assigns(:known_problem))
  end

  test "should show known_problem" do
    get :show, id: @known_problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @known_problem
    assert_response :success
  end

  test "should update known_problem" do
    patch :update, id: @known_problem, known_problem: {  }
    assert_redirected_to known_problem_path(assigns(:known_problem))
  end

  test "should destroy known_problem" do
    assert_difference('KnownProblem.count', -1) do
      delete :destroy, id: @known_problem
    end

    assert_redirected_to known_problems_path
  end
end
