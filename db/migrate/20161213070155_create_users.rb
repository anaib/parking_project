class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :city
      t.integer :phone_number
      t.integer :points

      t.timestamps

    end
  end
end
