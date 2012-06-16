class TimeRoster < ActiveRecord::Base
  attr_accessible :going_work_time, :quit_work_time, :work_date
  
end
