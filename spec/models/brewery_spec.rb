require 'rails_helper'

RSpec.describe Brewery do
  it 'validates the presence of name' do
    brewery = Brewery.new
    brewery.valid?
    expect(brewery.errors.messages[:brewery_name]).to include "can't be blank"
  end
end
