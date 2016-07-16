json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :email, :request_date_time, :message, :user_id, :brewery_id
  json.url reservation_url(reservation, format: :json)
end
