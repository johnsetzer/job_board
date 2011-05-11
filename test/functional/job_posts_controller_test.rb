require 'test_helper'

class JobPostsControllerTest < ActionController::TestCase
  setup do
    @job_post = job_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_post" do
    assert_difference('JobPost.count') do
      post :create, :job_post => @job_post.attributes
    end

    assert_redirected_to job_post_path(assigns(:job_post))
  end

  test "should show job_post" do
    get :show, :id => @job_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @job_post.to_param
    assert_response :success
  end

  test "should update job_post" do
    put :update, :id => @job_post.to_param, :job_post => @job_post.attributes
    assert_redirected_to job_post_path(assigns(:job_post))
  end

  test "should destroy job_post" do
    assert_difference('JobPost.count', -1) do
      delete :destroy, :id => @job_post.to_param
    end

    assert_redirected_to job_posts_path
  end
end
