require 'test_helper'

class TestCaseResultsControllerTest < ActionController::TestCase
  setup do
    @test_case_result = test_case_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_case_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_case_result" do
    assert_difference('TestCaseResult.count') do
      post :create, test_case_result: { status: @test_case_result.status, submission_id: @test_case_result.submission_id }
    end

    assert_redirected_to test_case_result_path(assigns(:test_case_result))
  end

  test "should show test_case_result" do
    get :show, id: @test_case_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_case_result
    assert_response :success
  end

  test "should update test_case_result" do
    patch :update, id: @test_case_result, test_case_result: { status: @test_case_result.status, submission_id: @test_case_result.submission_id }
    assert_redirected_to test_case_result_path(assigns(:test_case_result))
  end

  test "should destroy test_case_result" do
    assert_difference('TestCaseResult.count', -1) do
      delete :destroy, id: @test_case_result
    end

    assert_redirected_to test_case_results_path
  end
end
