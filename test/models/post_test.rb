require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@user = users(:paul)
  	@post = @user.post.build(content: "test")
end
end
