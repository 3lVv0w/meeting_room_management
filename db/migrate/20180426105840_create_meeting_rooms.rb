class CreateMeetingRooms < ActiveRecord::Migration
  def change
    create_table :meeting_rooms do |t|
      t.string :name, null: false
      t.string :status, null: false

      t.timestamps null: false
    end
  end
end
