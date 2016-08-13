require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new title: 'something', content: 'this is a sample post.'
  end

  test "tilte should be there and not be too short" do
    @post.title = ''
    assert_not @post.valid?    
    @post.title = '1'
    assert_not @post.valid?    
    @post.title = 'ABC'
    assert @post.valid?
  end

  test "content should be there and not be too short" do
    assert @post.valid?

    @post.content = ''
    assert_not @post.valid?  
    @post.content = '9000'
    assert_not @post.valid?
    @post.content = 'Good to go'
    assert @post.valid?
  end

  test "reject bad words in posts" do
    @post.title = "go to hell"
    assert_not @post.valid?
    @post.content = "damn you"
    assert_not @post.valid?
    @post.content = @post.title = "stupid !"
    assert_not @post.valid?    
  end
end
