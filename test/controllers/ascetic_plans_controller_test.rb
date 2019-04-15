require 'test_helper'

class AsceticPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ascetic_plan = ascetic_plans(:one)
  end

  test "should get index" do
    get ascetic_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_ascetic_plan_url
    assert_response :success
  end

  test "should create ascetic_plan" do
    assert_difference('AsceticPlan.count') do
      post ascetic_plans_url, params: { ascetic_plan: { ascetic_practice_id: @ascetic_plan.ascetic_practice_id, date: @ascetic_plan.date } }
    end

    assert_redirected_to ascetic_plan_url(AsceticPlan.last)
  end

  test "should show ascetic_plan" do
    get ascetic_plan_url(@ascetic_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_ascetic_plan_url(@ascetic_plan)
    assert_response :success
  end

  test "should update ascetic_plan" do
    patch ascetic_plan_url(@ascetic_plan), params: { ascetic_plan: { ascetic_practice_id: @ascetic_plan.ascetic_practice_id, date: @ascetic_plan.date } }
    assert_redirected_to ascetic_plan_url(@ascetic_plan)
  end

  test "should destroy ascetic_plan" do
    assert_difference('AsceticPlan.count', -1) do
      delete ascetic_plan_url(@ascetic_plan)
    end

    assert_redirected_to ascetic_plans_url
  end
end
