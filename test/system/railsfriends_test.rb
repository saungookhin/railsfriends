require "application_system_test_case"

class RailsfriendsTest < ApplicationSystemTestCase
  setup do
    @railsfriend = railsfriends(:one)
  end

  test "visiting the index" do
    visit railsfriends_url
    assert_selector "h1", text: "Railsfriends"
  end

  test "creating a Railsfriend" do
    visit railsfriends_url
    click_on "New Railsfriend"

    fill_in "Email", with: @railsfriend.email
    fill_in "First name", with: @railsfriend.first_name
    fill_in "Last name", with: @railsfriend.last_name
    fill_in "Phone", with: @railsfriend.phone
    fill_in "Twitter", with: @railsfriend.twitter
    click_on "Create Railsfriend"

    assert_text "Railsfriend was successfully created"
    click_on "Back"
  end

  test "updating a Railsfriend" do
    visit railsfriends_url
    click_on "Edit", match: :first

    fill_in "Email", with: @railsfriend.email
    fill_in "First name", with: @railsfriend.first_name
    fill_in "Last name", with: @railsfriend.last_name
    fill_in "Phone", with: @railsfriend.phone
    fill_in "Twitter", with: @railsfriend.twitter
    click_on "Update Railsfriend"

    assert_text "Railsfriend was successfully updated"
    click_on "Back"
  end

  test "destroying a Railsfriend" do
    visit railsfriends_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Railsfriend was successfully destroyed"
  end
end
