require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('allows the user to see a list of stylists on the index') do
    visit('/')
    expect(page).to have_content('GetYourHairDidRight')
  end
end
