# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate Users
User.create(email: 'admin@cask.com', password: 'password', password_confirmation: 'password')
User.create(email: 'user1@cask.com', password: 'password', password_confirmation: 'password')
User.create(email: 'user2@cask.com', password: 'password', password_confirmation: 'password')
User.create(email: 'user3@cask.com', password: 'password', password_confirmation: 'password')
User.create(email: 'user4@cask.com', password: 'password', password_confirmation: 'password')

# Generate Breweries
Brewery.create(brewery_name: 'brewery0', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 0, owner_id: 0)
Brewery.create(brewery_name: 'brewery1', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 0, owner_id: 1)
Brewery.create(brewery_name: 'brewery2', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 0, owner_id: 2)
Brewery.create(brewery_name: 'brewery3', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 0, owner_id: 3)
Brewery.create(brewery_name: 'brewery4', brewery_country: 'USA', brewery_location: 'Chicago', beer_count: 0, owner_id: 4)