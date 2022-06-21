class AddZipToBreweries < ActiveRecord::Migration[7.0]
  def change
    remove_column :breweries, :ZIP_codes
    add_column :breweries, :zip, :string
  end
end
