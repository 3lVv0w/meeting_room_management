class AddUserAndStatusToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :user, index: true
    add_column :reservations, :taken, :boolean, default: false
  end
end
