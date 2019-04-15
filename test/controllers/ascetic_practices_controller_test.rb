require 'test_helper'

class AsceticPracticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ascetic_practice = ascetic_practices(:one)
  end

  test "should get index" do
    get ascetic_practices_url
    assert_response :success
  end

  test "should get new" do
    get new_ascetic_practice_url
    assert_response :success
  end

  test "should create ascetic_practice" do
    assert_difference('AsceticPractice.count') do
      post ascetic_practices_url, params: { ascetic_practice: { description: @ascetic_practice.description } }
    end

    assert_redirected_to ascetic_practice_url(AsceticPractice.last)
  end

  test "should show ascetic_practice" do
    get ascetic_practice_url(@ascetic_practice)
    assert_response :success
  end

  test "should get edit" do
    get edit_ascetic_practice_url(@ascetic_practice)
    assert_response :success
  end

  test "should update ascetic_practice" do
    patch ascetic_practice_url(@ascetic_practice), params: { ascetic_practice: { description: @ascetic_practice.description } }
    assert_redirected_to ascetic_practice_url(@ascetic_practice)
  end

  test "should destroy ascetic_practice" do
    assert_difference('AsceticPractice.count', -1) do
      delete ascetic_practice_url(@ascetic_practice)
    end

    assert_redirected_to ascetic_practices_url
  end
end
