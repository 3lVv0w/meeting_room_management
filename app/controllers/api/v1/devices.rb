module API
  module V1
    class Devices < Grape::API
      include API::V1::Defaults
      include API::V1::DataPatterns

      resource :devices do
        desc 'Return all devices'
        get '', root: :devices do
          devices = Device.all
          return set_return('error', 'can not find any device') if devices.nil?
          all_devices = []
          devices.each do |device|
            all_devices << device_pattern(device)
          end
          set_return('success', 'found device', all_devices, 200)
        end

        desc 'Return a device'
        params do
          requires :hwid, type: String, desc: 'Hardware ID'
        end
        get ':hwid', root: 'device' do
          device = Device.find_by(hwid: permitted_params[:hwid])
          return set_return('error', 'can not find associate device') if device.nil?
          set_return('success', 'found device', meeting_room_pattern(device.meeting_room), 200)
        end
      end
    end
  end
end