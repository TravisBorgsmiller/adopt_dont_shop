require 'rails_helper'

RSpec.describe 'shelter index page' do
  before :each do
    @trav_shelter = Shelter.create(name: 'Trav Shelter',
                                  address: '10045 W grand',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: '80603')

    @nelly_shelter = Shelter.create(name: 'Nelly Shelter',
                                  address: '761 E Colfax',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: '80602')
  end

  it 'shows name of all shelters' do
    visit '/shelters'

    expect(page).to have_content(@trav_shelter.name)
    expect(page).to have_content(@nelly_shelter.name)
  end

  it 'has link to update shelter' do
    visit '/shelters'

    click_link "Update #{@trav_shelter.name}"
    expect(current_path).to eq("/shelters/#{@trav_shelter.id}/edit")
  end

  it 'has link to delete shelter' do
    visit '/shelters'

    click_link "Delete #{@nelly_shelter.name}"
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@nelly_shelter.name)
  end 
end
