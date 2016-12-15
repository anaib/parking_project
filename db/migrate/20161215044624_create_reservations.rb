class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :city
      t.string :zipcode
      t.time :time
      t.date :date
      t.integer :user_id

      t.timestamps

    end
  end
end
