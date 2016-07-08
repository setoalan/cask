class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :brewery_name
      t.string :brewery_country
      t.string :brewery_location
      t.integer :beer_count
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
