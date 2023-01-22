require "application_system_test_case"

class SeekersTest < ApplicationSystemTestCase
  setup do
    @seeker = seekers(:one)
  end

  test "visiting the index" do
    visit seekers_url
    assert_selector "h1", text: "Seekers"
  end

  test "should create seeker" do
    visit seekers_url
    click_on "New seeker"

    fill_in "Latitude", with: @seeker.latitude
    fill_in "Longitude", with: @seeker.longitude
    check "Status" if @seeker.status
    fill_in "Username", with: @seeker.username
    click_on "Create Seeker"

    assert_text "Seeker was successfully created"
    click_on "Back"
  end

  test "should update Seeker" do
    visit seeker_url(@seeker)
    click_on "Edit this seeker", match: :first

    fill_in "Latitude", with: @seeker.latitude
    fill_in "Longitude", with: @seeker.longitude
    check "Status" if @seeker.status
    fill_in "Username", with: @seeker.username
    click_on "Update Seeker"

    assert_text "Seeker was successfully updated"
    click_on "Back"
  end

  test "should destroy Seeker" do
    visit seeker_url(@seeker)
    click_on "Destroy this seeker", match: :first

    assert_text "Seeker was successfully destroyed"
  end
end
