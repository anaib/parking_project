class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :city
      t.integer :zipcode
      t.integer :user_id

      t.timestamps

    end
  end
end
