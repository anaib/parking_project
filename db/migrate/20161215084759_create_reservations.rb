class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :city
      t.string :zipcode
      t.string :time
      t.date :date
      t.integer :offer_user_id
      t.integer :accept_user_id

      t.timestamps

    end
  end
end
