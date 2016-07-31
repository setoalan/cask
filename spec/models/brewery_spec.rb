require 'rails_helper'

RSpec.describe Brewery, type: :model do

  it 'validates the presence of name' do
    brewery = Brewery.new
    brewery.valid?
    expect(brewery.errors.messages[:brewery_name]).to include "can't be blank"
  end

  it 'validates the presence of brewery_location' do
    brewery = Brewery.new
    brewery.valid?
    expect(brewery.errors.messages[:brewery_location]).to include "can't be blank"
  end

  it 'validates the presence of brewery_country' do
    brewery = Brewery.new
    brewery.valid?
    expect(brewery.errors.messages[:brewery_country]).to include "can't be blank"
  end
end
