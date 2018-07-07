module API
  module V1
    module DataPatterns
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json

        helpers do
          def meeting_room_pattern(meeting_room)
            {
              'id': meeting_room.id,
              'name': meeting_room.name,
              'status': meeting_room.status,
              'device': meeting_room.device&.hwid || 'not bind',
              'updated_at': meeting_room.updated_at
            }
          end

          def device_pattern(device)
            {
              'id': device.id,
              'HWID': device.hwid,
              'active': device.active,
              'meeting room': device.meeting_room&.name || 'not bind',
              'last update': device.updated_at
            }
          end

          def reservation_pattern(reservation)
            {
              'id': reservation.id,
              'topic': reservation.topic,
              'date': reservation.date,
              'from': reservation.from,
              'to': reservation.to,
              'MeetingRoom': reservation.meeting_room&.name || 'not taken',
              'user': reservation.user&.name || 'not taken',
              'taken': reservation.taken
            }
          end

          def user_pattern(user)
            {
              'id': user.id,
              'name': user.name
            }
          end
        end
      end
    end
  end
end