require 'test_helper'

class TimeRostersControllerTest < ActionController::TestCase
  setup do
    @time_roster = time_rosters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_rosters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_roster" do
    assert_difference('TimeRoster.count') do
      post :create, time_roster: { going_work_time: @time_roster.going_work_time, quit_work_time: @time_roster.quit_work_time, work_date: @time_roster.work_date }
    end

    assert_redirected_to time_roster_path(assigns(:time_roster))
  end

  test "should show time_roster" do
    get :show, id: @time_roster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_roster
    assert_response :success
  end

  test "should update time_roster" do
    put :update, id: @time_roster, time_roster: { going_work_time: @time_roster.going_work_time, quit_work_time: @time_roster.quit_work_time, work_date: @time_roster.work_date }
    assert_redirected_to time_roster_path(assigns(:time_roster))
  end

  test "should destroy time_roster" do
    assert_difference('TimeRoster.count', -1) do
      delete :destroy, id: @time_roster
    end

    assert_redirected_to time_rosters_path
  end
end
