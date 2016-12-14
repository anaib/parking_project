class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :type_of_car
      t.string :car_manf
      t.string :car_model
      t.string :car_registration
      t.string :car_color
      t.integer :user_id

      t.timestamps

    end
  end
end
