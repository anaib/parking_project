class CreateSpotsAvaiables < ActiveRecord::Migration
  def change
    create_table :spots_avaiables do |t|
      t.string :streets
      t.time :time
      t.boolean :thanks
      t.integer :info_id

      t.timestamps

    end
  end
end
