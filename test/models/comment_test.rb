require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @topic = Topic.create(name: "AWS")
    @user = User.create(email: "test@test.com", mobile: "0123456789",
      password: "password", password_confirmation: "password")
    @post = Post.create(title: "Testing Post", content: "testing", view: 0, topic_id: @topic.id, user_id: @user.id)
    @comment = Comment.new(content: "testing", post_id: @post.id, user_id: @user.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end
  
end
