require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  
    def setup
        @topic = Topic.create(name: "AWS")
    end

    test "should redirect to home_path after toggle the topic" do
        put toggle_topic_path(@topic)
        assert_redirected_to home_path
    end

end
