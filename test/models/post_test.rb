require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @topic = Topic.create(name: "AWS")
    @user = User.create(email: "test@test.com", mobile: "0123456789",
      password: "password", password_confirmation: "password")
    @post = Post.new(title: "Testing Post", content: "testing", view: 0, topic_id: @topic.id, user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "post title cannot be empty" do
    @post.title = "  "
    assert_not @post.valid?
  end

  test "post content cannot be empty" do
    @post.content = "  "
    assert_not @post.valid?
  end

  test "post cannot be created if topic id is not valid" do
    # random topic id
    @post.topic_id = 2000
    assert_not @post.valid?
  end

  test "post cannot be created if user id is not valid" do
    # random user id
    @post.topic_id = 2000
    assert_not @post.valid?
  end

  test "post cannot be created if user_id and topic_id are not valid" do
    # random user id
    @post.topic_id = 2000
    @post.user_id = 2000
    assert_not @post.valid?
  end


end
