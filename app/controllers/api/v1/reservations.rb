module API
  module V1
    class Reservations < Grape::API
      include API::V1::Defaults
      include API::V1::DataPatterns

      resource :reservations do
        desc "Return all reservations"
        get '', root: :reservations do
          reservations = Reservation.all
          return set_return('error', 'can not find any reservation') if reservations.nil?
          all_reservation = []
          reservations.each do |reservation|
            all_reservation << reservation_pattern(reservation)
          end
          set_return('success', 'found device', all_reservation, 200)
        end

        desc "Return a reservation"
        params do
          requires :id, type: String, desc: 'ID of the reservation'
        end
        get ":id", root: "reservation" do
          reservation = Reservation.find(permitted_params[:id])
          return set_return('error', 'can not find any reservation') if reservation.nil?
          set_return('success', 'found reservation', reservation_pattern(reservation), 200)
        end
      end
    end
  end
end