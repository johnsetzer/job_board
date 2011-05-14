require 'test_helper'

class JobPostTest < ActiveSupport::TestCase

  test 'attributes must not be empty' do
    post = JobPost.new
    assert post.invalid?

    assert_equal 'can\'t be blank', post.errors[:title].join(';')
    assert_equal 'can\'t be blank', post.errors[:company].join(';')
    assert_equal 'can\'t be blank', post.errors[:description].join(';')
  end

  test 'attributes must not be too long' do
    post = JobPost.new
    post.title = 'a' * 51
    post.company = 'a' * 51
    assert post.invalid?

    assert_equal 'is too long (maximum is 50 characters)', post.errors[:title].join(';')
    assert_equal 'is too long (maximum is 50 characters)', post.errors[:company].join(';')
  end

  test 'save and find' do
    created_post = JobPost.create(:user => users(:poster), :title => 'save and find title', :company => 'company', :description => 'description')
    found_posts = JobPost.where(:title => 'save and find title')
    
    assert_equal 1, found_posts.size
    found_post = found_posts.first

    assert_equal 'save and find title', found_post.title
    assert_equal 'company', found_post.company
    assert_equal 'description', found_post.description
    assert_equal created_post, found_post
  end

end
