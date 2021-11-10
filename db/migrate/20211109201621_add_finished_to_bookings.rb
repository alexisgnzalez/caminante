class AddFinishedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :finished, :boolean, default: false
  end
end
