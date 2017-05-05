class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.integer :occupancy
      t.integer :user_id
      t.integer :house_id

      t.timestamps
    end
  end
end
