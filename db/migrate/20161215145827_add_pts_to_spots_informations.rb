class AddPtsToSpotsInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :spots_informations, :num_thanks, :integer
    add_column :spots_informations, :pts, :integer
  end
end
