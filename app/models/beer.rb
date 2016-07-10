class Beer < ActiveRecord::Base
  validates :beer_name, presence: true
  validates :beer_style, presence: true
  belongs_to :brewery
end
