class AddMeetingRoomToDevice < ActiveRecord::Migration
  def change
    add_reference :devices, :meeting_room, index: true
  end
end
