class AddDeviceToMeetingRoom < ActiveRecord::Migration
  def change
    add_reference :meeting_rooms, :device, index: true
  end
end
