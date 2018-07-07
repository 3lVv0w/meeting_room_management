class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :topic, null: false
      t.date  :date, null: false
      t.time  :from, null: false
      t.time :to, null: false
      t.references(:meeting_room, index: true)

      t.timestamps null: false
    end
  end
end
