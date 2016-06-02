require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "page_title helper" do
    something = "any title"
    base = "Blog App"
    assert_equal base, page_title
    assert_equal "#{something} | #{base}", page_title(something)
  end
end