ActiveAdmin.register Reservation do

permit_params :meeting_room_id, :topic, :date, :from, :to

end
