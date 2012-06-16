require 'test_helper'

class TimeRosterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "test_data_count" do
    roster = Time_Roster.find(:all)
    assert 3,roster.length
  end
  
  test "test_unique_test" do
    roster = Time_roster.create(
      :work_date => '2012-05-19',
      :going_work_time => '2013-05-20 8:15:00',
      :quit_work_time => '2013-05-20 17:15:00'
    )
    
    roster_all = Time_Roster.find(:all)
    assert 3,roster_all.length
  end
  
  test "test_update_test" do
    
  end
end
