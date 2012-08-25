class TimeRoster < ActiveRecord::Base
  has_one :timeroster_line
  attr_accessible :going_work_time, :quit_work_time, :work_date
  
end
