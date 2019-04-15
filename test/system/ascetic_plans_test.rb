require "application_system_test_case"

class AsceticPlansTest < ApplicationSystemTestCase
  setup do
    @ascetic_plan = ascetic_plans(:one)
  end

  test "visiting the index" do
    visit ascetic_plans_url
    assert_selector "h1", text: "Ascetic Plans"
  end

  test "creating a Ascetic plan" do
    visit ascetic_plans_url
    click_on "New Ascetic Plan"

    fill_in "Ascetic practice", with: @ascetic_plan.ascetic_practice_id
    fill_in "Date", with: @ascetic_plan.date
    click_on "Create Ascetic plan"

    assert_text "Ascetic plan was successfully created"
    click_on "Back"
  end

  test "updating a Ascetic plan" do
    visit ascetic_plans_url
    click_on "Edit", match: :first

    fill_in "Ascetic practice", with: @ascetic_plan.ascetic_practice_id
    fill_in "Date", with: @ascetic_plan.date
    click_on "Update Ascetic plan"

    assert_text "Ascetic plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Ascetic plan" do
    visit ascetic_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ascetic plan was successfully destroyed"
  end
end
