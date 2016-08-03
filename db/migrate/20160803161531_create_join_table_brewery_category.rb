class CreateJoinTableBreweryCategory < ActiveRecord::Migration
  def change
    create_join_table :breweries, :categories do |t|
      # t.index [:brewery_id, :category_id]
      # t.index [:category_id, :brewery_id]
    end
  end
end
