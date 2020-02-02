require 'rails_helper'

RSpec.describe 'As a visitor, when I visit shelter show page' do
  before :each do
    @trav_shelter = Shelter.create(name: 'Trav Shelter',
                                  address: '10045 W grand',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: '80603')

    @buster = @trav_shelter.pets.create(name: 'Buster',
                              description: 'Friendly',
                              approximate_age: 3,
                              sex: 'male',
                              adoptable: 'adoptable',
                              image: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_2788,w_4960,x_0,y_255/f_auto,q_auto,w_1100/v1554918537/shape/mentalfloss/istock-488657289.jpg')
  end
  it 'shows me that shelter with its information' do
    visit "/shelters/#{@trav_shelter.id}"
    expect(current_path).to eq("/shelters/#{@trav_shelter.id}")

    expect(page).to have_content(@trav_shelter.name)
    expect(page).to have_content(@trav_shelter.address)
    expect(page).to have_content(@trav_shelter.city)
    expect(page).to have_content(@trav_shelter.state)
    expect(page).to have_content(@trav_shelter.zip)
  end
  it 'has link to visit shelter pets index' do
    visit "/shelters/#{@trav_shelter.id}"
    expect(current_path).to eq("/shelters/#{@trav_shelter.id}")

    click_link "See all pets in #{@trav_shelter.name}"
    expect(current_path).to eq("/shelters/#{@trav_shelter.id}/pets")
    expect(page).to have_content(@buster.name)
  end 
end
