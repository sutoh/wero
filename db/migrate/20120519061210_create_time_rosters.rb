class CreateTimeRosters < ActiveRecord::Migration
  def change
    create_table :time_rosters do |t|
      t.date :work_date
      t.time :going_work_time
      t.time :quit_work_time

      t.timestamps
    end
  end
end
