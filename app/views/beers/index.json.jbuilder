json.array!(@beers) do |beer|
  json.extract! beer, :id, :beer_name, :beer_abv, :beer_ibu, :beer_description, :beer_style, :brewery_id
  json.url beer_url(beer, format: :json)
end
