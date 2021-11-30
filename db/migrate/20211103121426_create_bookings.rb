class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :place 
      t.string :movie
      t.string :date 
      t.string :time
    end
  end
end
