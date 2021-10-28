class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :days, :integer
    add_column :bookings, :total_amount, :integer
  end
end
