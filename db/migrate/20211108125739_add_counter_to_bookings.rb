class AddCounterToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :counter, :integer
  end
end
