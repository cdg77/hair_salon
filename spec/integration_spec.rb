require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('allows the user to see a list of stylists on the index') do
    visit('/')
    expect(page).to have_content('GetYourHairDidRight')
  end

  it('allows the user to add a stylist to the salon') do
    visit('/')
    fill_in('new_stylist', :with => 'Zohan Dvir')
    click_button('ADD STYLIST')
    expect(page).to have_content('Zohan Dvir')
  end
end
