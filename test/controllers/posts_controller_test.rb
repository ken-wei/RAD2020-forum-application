require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:james)
    @topic = topics(:react)
    @post = Post.create(title: "Testing Post", content: "testing", view: 0, topic_id: @topic.id, user_id: @user.id)
  end

  test "should redirect new post if not logged in" do
    get new_post_path
    assert_redirected_to login_url 
  end

  test "should redirect to new post if logged in" do
    log_in_as(@user)
    get new_post_path
    assert_template :new
  end

  test "should go to the post's page" do
    get post_path(@post.id)
    assert_template  :show
  end


end
