class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :beer_name
      t.integer :beer_abv
      t.integer :beer_ibu
      t.string :beer_description
      t.string :beer_style
      t.integer :brewery_id

      t.timestamps null: false
    end
  end
end
