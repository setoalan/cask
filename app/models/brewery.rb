class Brewery < ActiveRecord::Base
  validates :brewery_name, presence: true
  validates :brewery_country, presence: true
  validates :brewery_location, presence: true
  belongs_to :user
  has_many :beers, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :starred_by, through: :stars, source: :user
  has_and_belongs_to_many :categories

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
