require "test_helper"

class RailsfriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railsfriend = railsfriends(:one)
  end

  test "should get index" do
    get railsfriends_url
    assert_response :success
  end

  test "should get new" do
    get new_railsfriend_url
    assert_response :success
  end

  test "should create railsfriend" do
    assert_difference('Railsfriend.count') do
      post railsfriends_url, params: { railsfriend: { email: @railsfriend.email, first_name: @railsfriend.first_name, last_name: @railsfriend.last_name, phone: @railsfriend.phone, twitter: @railsfriend.twitter } }
    end

    assert_redirected_to railsfriend_url(Railsfriend.last)
  end

  test "should show railsfriend" do
    get railsfriend_url(@railsfriend)
    assert_response :success
  end

  test "should get edit" do
    get edit_railsfriend_url(@railsfriend)
    assert_response :success
  end

  test "should update railsfriend" do
    patch railsfriend_url(@railsfriend), params: { railsfriend: { email: @railsfriend.email, first_name: @railsfriend.first_name, last_name: @railsfriend.last_name, phone: @railsfriend.phone, twitter: @railsfriend.twitter } }
    assert_redirected_to railsfriend_url(@railsfriend)
  end

  test "should destroy railsfriend" do
    assert_difference('Railsfriend.count', -1) do
      delete railsfriend_url(@railsfriend)
    end

    assert_redirected_to railsfriends_url
  end
end
