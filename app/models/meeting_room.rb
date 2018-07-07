class MeetingRoom < ActiveRecord::Base
  has_many :reservations
  belongs_to :device

  def preset(room_id)
    16.times do |i|
      Reservation.create(
        topic: "Open for everyone",
        date: Time.current,
        from: Time.current.beginning_of_hour+1800*(i+1),
        to: Time.current.beginning_of_hour+3600*(i+1),
        meeting_room_id: room_id
      )
    end
  end
end
