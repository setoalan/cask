require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

RSpec.describe UsersController, type: :controller do

  it 'users able to sign in' do
    visit '/users/sign_in'

    fill_in 'Email',    with: 'user2@cask.com'
    fill_in 'Password', with: 'asdfjkl;'

    click_button 'Log in'

    visit '/users'

    expect(page).to have_content 'Access denied.'
  end

end
