class Brewery < ActiveRecord::Base
  validates :brewery_name, presence: true
  validates :brewery_country, presence: true
  validates :brewery_location, presence: true
  belongs_to :user
  has_many :beers
  has_many :reservations

  def self.add_beer(brewery_id)
    @brewery = Brewery.find(brewery_id)
    @brewery.beer_count += 1
    @brewery.save
  end

  def self.subtract_beer(brewery_id)
    @brewery = Brewery.find(brewery_id)
    @brewery.beer_count -= 1
    @brewery.save
  end
  
end
