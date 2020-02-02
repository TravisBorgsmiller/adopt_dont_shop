require 'rails_helper'

RSpec.describe 'As a visitor when I visit pet show page' do
  it 'shows the pet with relevant info' do

    trav_shelter = Shelter.create(name: 'Trav Shelter',
                                  address: '10045 W grand',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zip: '80603')

    buster = trav_shelter.pets.create(name: 'Buster',
                              description: 'Friendly',
                              approximate_age: 3,
                              sex: 'male',
                              adoptable: 'adoptable',
                              image: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_2788,w_4960,x_0,y_255/f_auto,q_auto,w_1100/v1554918537/shape/mentalfloss/istock-488657289.jpg')

    visit "/pets/#{buster.id}"
    expect(current_path).to eq("/pets/#{buster.id}")

    expect(page).to have_content(buster.image)
    expect(page).to have_content(buster.name)
    expect(page).to have_content(buster.description)
    expect(page).to have_content(buster.approximate_age)
    expect(page).to have_content(buster.sex)
    expect(page).to have_content(buster.adoptable)
  end
end
