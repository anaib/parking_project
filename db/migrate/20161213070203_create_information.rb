class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :city
      t.string :neighborhood
      t.integer :user_id

      t.timestamps

    end
  end
end
