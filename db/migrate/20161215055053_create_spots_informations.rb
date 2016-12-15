class CreateSpotsInformations < ActiveRecord::Migration
  def change
    create_table :spots_informations do |t|
      t.string :city
      t.integer :user_id
      t.string :zipcode
      t.text :streets
      t.boolean :thanks

      t.timestamps

    end
  end
end
