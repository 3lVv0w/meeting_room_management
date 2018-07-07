class MeetingRoomsController < ApplicationController
  def index
    @meeting_rooms = MeetingRoom.all
  end

  def show
    @meeting_room = MeetingRoom.find(params[:id])
  end
end
