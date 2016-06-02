require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase  
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_select 'title', page_title
  end

  test 'should get help' do
    get :help
    assert_response :success
    assert_template 'help'
    assert_select 'title', page_title('Help') 
  end

  test 'should get contact' do
    get :contact
    assert_response :success
    assert_template 'contact'
    assert_select 'title', page_title('Contact')
  end 
end
