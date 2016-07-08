json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :brewery_name, :brewery_country, :brewery_location, :beer_count, :user_id
  json.url brewery_url(brewery, format: :json)
end
