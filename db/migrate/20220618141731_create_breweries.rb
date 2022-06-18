class CreateBreweries < ActiveRecord::Migration[7.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :ZIP_codes
      t.string :city
      t.time :open_at
      t.time :closed_at

      t.timestamps
    end
  end
end
