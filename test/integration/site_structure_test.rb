require 'test_helper'

class SiteStructureTest < ActionDispatch::IntegrationTest
  
  test "Site layout and general structure" do
    get root_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', root_path, count: 2

    get contact_path
    assert_match /[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i, response.body
  end
end
