class Brewery < ActiveRecord::Base
  belongs_to :user
  has_many :beers
end
