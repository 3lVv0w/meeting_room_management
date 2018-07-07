class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :hwid
      t.boolean :active

      t.timestamps null: false
    end
  end
end
