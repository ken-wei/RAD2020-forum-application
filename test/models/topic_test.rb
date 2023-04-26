require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  
  def setup
    @topic = Topic.new(name: "AWS")
  end

  test "should be valid" do
    assert @topic.valid?
  end

end
