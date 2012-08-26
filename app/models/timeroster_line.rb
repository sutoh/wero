class TimerosterLine < ActiveRecord::Base
  attr_accessible :time_roster_id, :user_id
  belongs_to :user
  belongs_to :timeroster

end
