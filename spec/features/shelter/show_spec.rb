require 'rails_helper'

RSpec.describe 'As a visitor, when I visit shelter show page' do
  it 'shows me that shelter with its information' do
    trav_shelter = Shelter.create(name: 'Trav Shelter',
                                  address: '10045 W grand',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: '80603')
    visit "/shelters/#{trav_shelter.id}"

    expect(page).to have_content(trav_shelter.name)
    expect(page).to have_content(trav_shelter.address)
    expect(page).to have_content(trav_shelter.city)
    expect(page).to have_content(trav_shelter.state)
    expect(page).to have_content(trav_shelter.zip)
  end
end
