require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    @post = posts [:one, :two].sample
    @admin = users :abdullah
    @user = users :sam
    @sample_post_params = { title: 'good job', 
                            content: 'always helps to remember ..' }
  end

  test "should give the index post publically" do
    get :index
    assert_response :success
    assert_template 'index'
    Post.all.each do |post| 
      assert_select "a[href=?]", post_path(post)
    end
  end

  test "should redirect new & create when not logged-in" do
    get :new
    assert_redirected_to new_user_session_url

    assert_no_difference 'Post.count' do
      post :create, post: @sample_post_params
    end
    assert_redirected_to new_user_session_url
  end

  test "should redirect update when not logged-in" do
    patch :update, id: @post, post: @sample_post_params
    assert_not_equal @post.title, @sample_post_params[:title]
    assert_not_equal @post.content, @sample_post_params[:content]

    assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged-in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end

    assert_redirected_to new_user_session_url
  end

  test "should reject create when not admin user" do
    sign_in @user
    assert_no_difference 'Post.count' do
      post :create, post: @sample_post_params
    end

    assert_redirected_to root_url
    assert_not flash[:danger].empty?
  end

  test "should reject update when not admin user" do    
    sign_in @user
    patch :update, id: @post, post: @sample_post_params
    assert_not_equal @post.title, @sample_post_params[:title]
    assert_not_equal @post.content, @sample_post_params[:content]
    
    assert_redirected_to root_url
    assert_not flash[:danger].empty?
  end

  test "should reject destroy when not admin user" do    
    sign_in @user
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end

    assert_redirected_to root_url
    assert_not flash[:danger].empty?
  end

  test "successful create with correct credentials and data" do    
    sign_in @admin
    assert_difference 'Post.count', 1 do
      post :create, post: @sample_post_params
    end
    assert_redirected_to Post.find_by(title: @sample_post_params[:title])
    assert_not flash[:success].empty?
  end

  test "successful update with correct credentials and data" do
    sign_in @admin
    patch :update, id: @post, post: @sample_post_params
    @post.reload
    assert_equal @post.title, @sample_post_params[:title]
    assert_equal @post.content, @sample_post_params[:content]

    assert_redirected_to Post.find_by(title: @sample_post_params[:title])
    assert_not flash[:success].empty?    
  end

  test "successful destroy with correct credentials and data" do
    sign_in @admin
    assert_difference 'Post.count', -1 do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_url
    assert_not flash[:success].empty?
  end

end
