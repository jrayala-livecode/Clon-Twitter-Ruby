require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweets_index_url
    assert_response :success
  end

  test "should get new" do
    get tweets_new_url
    assert_response :success
  end

  test "should get create" do
    get tweets_create_url
    assert_response :success
  end

  test "should get read" do
    get tweets_read_url
    assert_response :success
  end

  test "should get update" do
    get tweets_update_url
    assert_response :success
  end

  test "should get delete" do
    get tweets_delete_url
    assert_response :success
  end

end
