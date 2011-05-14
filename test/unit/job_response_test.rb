require 'test_helper'

class JobResponseTest < ActiveSupport::TestCase
  test 'attributes must not be empty' do
    response = JobResponse.new
    assert response.invalid?

    assert_equal 'can\'t be blank', response.errors[:response].join(';')
    assert_equal 'can\'t be blank', response.errors[:resume].join(';')
  end

  test 'save and find' do
    created_response = JobResponse.create(
      :user => users(:consultant),
      :job_post =>job_posts(:head_hunter_posts_manager),
      :response => 'I can manage people.',
      :resume => 'I am the lord of six sigma.')

    found_responses = JobResponse.where(:response => 'I can manage people.')

    assert_equal 1, found_responses.size
    found_response = found_responses.first

    assert_equal 'I can manage people.', found_response.response
    assert_equal 'I am the lord of six sigma.', found_response.resume
    assert_equal created_response, found_response
  end

  test 'associations' do
    manager = users(:manager)
    response = job_responses(:manager_applies_for_manager)
    post = job_posts(:head_hunter_posts_manager)

    assert_equal manager, response.user
    assert_equal post, response.job_post
  end
end
