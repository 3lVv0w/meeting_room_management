class ReservationsController < ApplicationController
  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(
      topic: params[:reservation][:topic],
      user_id: params[:reservation][:user_id],
      taken: true)

      redirect_to meeting_room_path(params[:meeting_room_id])
    else
      redirect_to edit_meeting_room_reservation_path(meeting_room.id, @reservation.id)
    end
  end

  def cancle
    @reservation = Reservation.find(params[:id])
    if @reservation.update(
      topic: "Open for everyone",
      user_id: nil,
      taken: false)

      redirect_to user_path(1) #current_user
    else
      redirect_to meeting_rooms_path
    end
  end
end
