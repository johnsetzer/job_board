require 'test_helper'

class JobResponsesControllerTest < ActionController::TestCase
  setup do
    @job_response = job_responses(:programmer_applies_for_programmer)
    @job_post = job_posts(:head_hunter_posts_programer)
  end

  test "should get index" do
    sign_in_user(:head_hunter)
    get :index, :job_post_id => @job_post
    assert_response :success
    assert_not_nil assigns(:job_responses)
  end

  test "should get new" do
    sign_in_user
    get :new, :job_post_id => @job_post
    assert_response :success
  end

  test "should create job_response" do
    sign_in_user
    assert_difference('JobResponse.count') do
      post :create, :job_response => @job_response.attributes, :job_post_id => @job_post
    end
    assert_not_nil assigns(:job_response)

    assert_redirected_to job_post_path(@job_post)
  end

  test "should show job_response" do
    sign_in_user(:head_hunter)
    get :show, :id => @job_response.to_param, :job_post_id => @job_post
    assert_response :success
  end

  test "should destroy job_response" do
    sign_in_user(:head_hunter)
    assert_difference('JobResponse.count', -1) do
      delete :destroy, :id => @job_response.to_param
    end

    assert_redirected_to job_post_job_responses_path(@job_post)
  end
end
