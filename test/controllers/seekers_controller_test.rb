require "test_helper"

class SeekersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seeker = seekers(:one)
  end

  test "should get index" do
    get seekers_url
    assert_response :success
  end

  test "should get new" do
    get new_seeker_url
    assert_response :success
  end

  test "should create seeker" do
    assert_difference("Seeker.count") do
      post seekers_url, params: { seeker: { latitude: @seeker.latitude, longitude: @seeker.longitude, status: @seeker.status, username: @seeker.username } }
    end

    assert_redirected_to seeker_url(Seeker.last)
  end

  test "should show seeker" do
    get seeker_url(@seeker)
    assert_response :success
  end

  test "should get edit" do
    get edit_seeker_url(@seeker)
    assert_response :success
  end

  test "should update seeker" do
    patch seeker_url(@seeker), params: { seeker: { latitude: @seeker.latitude, longitude: @seeker.longitude, status: @seeker.status, username: @seeker.username } }
    assert_redirected_to seeker_url(@seeker)
  end

  test "should destroy seeker" do
    assert_difference("Seeker.count", -1) do
      delete seeker_url(@seeker)
    end

    assert_redirected_to seekers_url
  end
end
