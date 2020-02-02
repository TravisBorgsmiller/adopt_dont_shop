require 'rails_helper'

RSpec.describe 'As a visitor when I go to pet show page' do
  it 'has a link to delete pet' do
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

    click_link "Delete #{buster.name}"
    expect(current_path).to eq('/pets')
    expect(page).to_not have_content(buster.name)
  end
end 
