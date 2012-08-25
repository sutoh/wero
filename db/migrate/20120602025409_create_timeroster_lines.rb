class CreateTimerosterLines < ActiveRecord::Migration
  def change
    create_table :timeroster_lines do |t|
      t.integer :user_id
      t.integer :time_roster_id

      t.timestamps
    end
  end
end
