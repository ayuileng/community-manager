require "test_helper"

class VisitSchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get visit_schedules_index_url
    assert_response :success
  end

  test "should get new" do
    get visit_schedules_new_url
    assert_response :success
  end

  test "should get edit" do
    get visit_schedules_edit_url
    assert_response :success
  end
end
