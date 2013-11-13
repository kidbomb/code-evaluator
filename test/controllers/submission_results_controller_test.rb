require 'test_helper'

class SubmissionResultsControllerTest < ActionController::TestCase
  setup do
    @submission_result = submission_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submission_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission_result" do
    assert_difference('SubmissionResult.count') do
      post :create, submission_result: {  }
    end

    assert_redirected_to submission_result_path(assigns(:submission_result))
  end

  test "should show submission_result" do
    get :show, id: @submission_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission_result
    assert_response :success
  end

  test "should update submission_result" do
    patch :update, id: @submission_result, submission_result: {  }
    assert_redirected_to submission_result_path(assigns(:submission_result))
  end

  test "should destroy submission_result" do
    assert_difference('SubmissionResult.count', -1) do
      delete :destroy, id: @submission_result
    end

    assert_redirected_to submission_results_path
  end
end
