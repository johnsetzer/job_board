# This test deliberately does NOT test devise functionality.

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def new_user(options={})
    default_options = {
      :name => 'Mr. New',
      :email => 'new@test.com',
      :password => 'opensaysme',
      :password_confirmation => 'opensaysme',
      :remember_me => true
    }
    default_options.merge!(options)
    User.new(default_options)
  end

  test 'attributes must not be empty' do
    user = new_user(:name => '')
    assert user.invalid?

    assert_equal 'can\'t be blank', user.errors[:name].join(';')
  end

  test 'attributes must not be too long' do
    user = new_user(:name => 'a' * 51)
    assert user.invalid?

    assert_equal 'is too long (maximum is 50 characters)', user.errors[:name].join(';')
  end

  test 'save and find' do
    created_user = new_user
    created_user.save

    found_users = User.where(:email => 'new@test.com')

    assert_equal 1, found_users.size
    found_user = found_users.first

    assert_equal 'Mr. New', found_user.name
    assert_equal created_user, found_user
  end

  test 'job posts' do
    user = users(:programmer)
    posts = user.job_posts

    assert_equal 1, posts.size
    assert posts.include? job_posts(:programmer_posts_consultant)
  end

  test 'job responses' do
    user = users(:programmer)
    responses = user.job_responses

    assert_equal 2, responses.size
    assert responses.include? job_responses(:programmer_applies_for_programmer)
    assert responses.include? job_responses(:programmer_applies_for_manager)
  end

  test 'cascading delete of posts' do
    user = users(:programmer)

    # Querying fixtures returns objects after they have been deleted so save IDs
    user_id = user.id
    post_id = user.job_posts[0].id

    user.destroy

    assert_raise ActiveRecord::RecordNotFound do User.find(user_id) end
    assert_raise ActiveRecord::RecordNotFound do JobPost.find(post_id) end
  end

  test 'cascading delete of responses' do
    user = users(:programmer)

    # Querying fixtures returns objects after they have been deleted so save IDs
    user_id = user.id
    first_resp_id = user.job_responses[0].id
    second_resp_id = user.job_responses[0].id

    user.destroy

    assert_raise ActiveRecord::RecordNotFound do User.find(user_id) end
    assert_raise ActiveRecord::RecordNotFound do JobResponse.find(first_resp_id) end
    assert_raise ActiveRecord::RecordNotFound do JobResponse.find(second_resp_id) end
  end
end
