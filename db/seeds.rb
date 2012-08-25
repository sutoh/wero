# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test = TimeRoster.create([ work_date: '2012/8/25 00:00:00', going_work_time: '2012/8/25 00:00:00',quit_work_time: '2012/8/25 00:00:00' ])
user = User.find(1)
line = TimerosterLine.create([ user_id: user, time_roster_id: test])
