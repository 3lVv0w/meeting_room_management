module API
  module V1
    class Base < Grape::API
      mount API::V1::Reservations
      mount API::V1::Devices
    end
  end
end