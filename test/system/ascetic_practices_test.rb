require "application_system_test_case"

class AsceticPracticesTest < ApplicationSystemTestCase
  setup do
    @ascetic_practice = ascetic_practices(:one)
  end

  test "visiting the index" do
    visit ascetic_practices_url
    assert_selector "h1", text: "Ascetic Practices"
  end

  test "creating a Ascetic practice" do
    visit ascetic_practices_url
    click_on "New Ascetic Practice"

    fill_in "Description", with: @ascetic_practice.description
    click_on "Create Ascetic practice"

    assert_text "Ascetic practice was successfully created"
    click_on "Back"
  end

  test "updating a Ascetic practice" do
    visit ascetic_practices_url
    click_on "Edit", match: :first

    fill_in "Description", with: @ascetic_practice.description
    click_on "Update Ascetic practice"

    assert_text "Ascetic practice was successfully updated"
    click_on "Back"
  end

  test "destroying a Ascetic practice" do
    visit ascetic_practices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ascetic practice was successfully destroyed"
  end
end
