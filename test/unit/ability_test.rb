require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  test "peopel who aren't logged in can view job posts" do
    post = job_posts(:head_hunter_posts_manager)
    ability = Ability.new(nil)
    
    assert ability.can?(:read, post)
    assert ability.cannot?(:create, post)
    assert ability.cannot?(:modify, post)
  end

  test "people who aren't logged in cannot respond" do
    ability = Ability.new(nil)
    thier_response = job_responses(:manager_applies_for_manager)

    assert ability.cannot?(:create, JobResponse.new)
    assert ability.cannot?(:read, thier_response)
    assert ability.cannot?(:modify, thier_response)
  end

  test "users can read other's posts" do
    post = job_posts(:head_hunter_posts_manager)
    user = users(:programmer)
    ability = Ability.new(user)

    assert ability.can?(:read, post)
  end

  test "users can create job posts" do
    user = users(:programmer)
    ability = Ability.new(user)

    assert ability.can?(:create, JobPost.new)
  end

  test "users can only modify their own job posts" do
    their_post = job_posts(:head_hunter_posts_manager)
    my_post = job_posts(:programmer_posts_consultant)

    user = users(:programmer)
    ability = Ability.new(user)

    assert ability.can?(:modify, my_post)
    assert ability.cannot?(:modify, their_post)
  end

  test "users can create job responses" do
    user = users(:programmer)
    ability = Ability.new(user)
    my_response = job_responses(:programmer_applies_for_programmer)
    thier_response = job_responses(:manager_applies_for_manager)


    assert ability.can?(:create, JobResponse.new)

    assert ability.cannot?(:read, my_response)
    assert ability.cannot?(:modify, my_response)
    assert ability.cannot?(:read, thier_response)
    assert ability.cannot?(:modify, thier_response)
  end

  test "users can view or destroy responses to their posts" do
    user = users(:programmer)
    ability = Ability.new(user)

    my_post_response = job_responses(:consultant_applies_for_consultant)
    their_post_response = job_responses(:programmer_applies_for_programmer)

    assert ability.can?(:read, my_post_response)
    assert ability.can?(:destroy, my_post_response)

    assert ability.cannot?(:read, their_post_response)
    assert ability.cannot?(:destroy, their_post_response)

    assert ability.cannot?(:update, my_post_response)
    assert ability.cannot?(:update, their_post_response)
  end

end
