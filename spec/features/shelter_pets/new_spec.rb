require 'rails_helper'

RSpec.describe 'As a visitor when I visit shelterpets index page' do
  it 'has link that takes me to create a new pet for that shelter' do

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


    visit "/shelters/#{trav_shelter.id}/pets"
    expect(current_path).to eq("/shelters/#{trav_shelter.id}/pets")

    click_link "Create New Pet For #{trav_shelter.name}"
    expect(current_path).to eq("/shelters/#{buster.shelter_id}/pets/new")

    fill_in 'image', with: 'https://images.unsplash.com/photo-1493236296276-d17357e28888?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'
    fill_in 'name', with: 'Parry'
    fill_in 'description', with: 'Chirpy'
    fill_in 'approximate_age', with: '3'
    fill_in 'sex', with: 'female'

    click_button 'Submit'
    expect(current_path).to eq("/shelters/#{trav_shelter.id}/pets")
    expect(page).to have_content('Parry')
  end
end
