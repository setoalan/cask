class Brewery < ActiveRecord::Base
  validates :brewery_name, presence: true
  validates :brewery_country, presence: true
  validates :brewery_location, presence: true
  belongs_to :user
  has_many :beers
  has_many :reservations
end
