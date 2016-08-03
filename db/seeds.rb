# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate Users
User.create(email: 'admin@cask.com', name: 'admin', password: 'asdfjkl;', password_confirmation: 'asdfjkl;', role: 'admin')
User.create(email: 'user2@cask.com', name: 'user2', password: 'asdfjkl;', password_confirmation: 'asdfjkl;')
User.create(email: 'user3@cask.com', name: 'user3', password: 'asdfjkl;', password_confirmation: 'asdfjkl;')
User.create(email: 'user4@cask.com', name: 'user4', password: 'asdfjkl;', password_confirmation: 'asdfjkl;')
User.create(email: 'user5@cask.com', name: 'user5', password: 'asdfjkl;', password_confirmation: 'asdfjkl;')

# Generate Breweries
Brewery.create(brewery_name: 'brewery1', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 1, user_id: 1)
Brewery.create(brewery_name: 'brewery2', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 1, user_id: 2)
Brewery.create(brewery_name: 'brewery3', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 1, user_id: 3)
Brewery.create(brewery_name: 'brewery4', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 1, user_id: 4)
Brewery.create(brewery_name: 'brewery5', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 1, user_id: 5)

# Generate Beers
Beer.create(beer_name: 'beer1', beer_abv: 100, beer_ibu: 100, beer_description: 'beer1 description', beer_style: 'Ale', brewery_id: 1)
Beer.create(beer_name: 'beer2', beer_abv: 100, beer_ibu: 100, beer_description: 'beer2 description', beer_style: 'Ale', brewery_id: 2)
Beer.create(beer_name: 'beer3', beer_abv: 100, beer_ibu: 100, beer_description: 'beer3 description', beer_style: 'Ale', brewery_id: 3)
Beer.create(beer_name: 'beer4', beer_abv: 100, beer_ibu: 100, beer_description: 'beer4 description', beer_style: 'Ale', brewery_id: 4)
Beer.create(beer_name: 'beer5', beer_abv: 100, beer_ibu: 100, beer_description: 'beer5 description', beer_style: 'Ale', brewery_id: 5)

# Generate Reservations
Reservation.create(email: 'admin@cask.com', request_date_time: Time.now, message: 'admin reservation', user_id: '1', brewery_id: '2')
Reservation.create(email: 'user2@cask.com', request_date_time: Time.now, message: 'user2 reservation', user_id: '2', brewery_id: '3')
Reservation.create(email: 'user3@cask.com', request_date_time: Time.now, message: 'user3 reservation', user_id: '3', brewery_id: '4')
Reservation.create(email: 'user4@cask.com', request_date_time: Time.now, message: 'user4 reservation', user_id: '4', brewery_id: '5')
Reservation.create(email: 'user5@cask.com', request_date_time: Time.now, message: 'user5 reservation', user_id: '5', brewery_id: '1')

# Generate Stars
Star.create(user_id: 1, brewery_id: 2)
Star.create(user_id: 2, brewery_id: 3)
Star.create(user_id: 3, brewery_id: 4)
Star.create(user_id: 4, brewery_id: 5)
Star.create(user_id: 5, brewery_id: 1)

# Generate Categories
Category.create(name: 'Macro Brewery')
Category.create(name: 'Micro Brewery')
Category.create(name: 'Nano Brewery')
Category.create(name: 'Brew Pub')
Category.create(name: 'Home Brewery')
