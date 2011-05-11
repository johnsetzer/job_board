require 'test_helper'

class JobResponsesControllerTest < ActionController::TestCase
  setup do
    @job_response = job_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_response" do
    assert_difference('JobResponse.count') do
      post :create, :job_response => @job_response.attributes
    end

    assert_redirected_to job_response_path(assigns(:job_response))
  end

  test "should show job_response" do
    get :show, :id => @job_response.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @job_response.to_param
    assert_response :success
  end

  test "should update job_response" do
    put :update, :id => @job_response.to_param, :job_response => @job_response.attributes
    assert_redirected_to job_response_path(assigns(:job_response))
  end

  test "should destroy job_response" do
    assert_difference('JobResponse.count', -1) do
      delete :destroy, :id => @job_response.to_param
    end

    assert_redirected_to job_responses_path
  end
end
