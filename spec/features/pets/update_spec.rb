require 'rails_helper'

RSpec.describe 'As a visitor when I visit the pets show page' do
  it 'has a link to update the pet information' do

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

    click_link "Update #{buster.name}"
    expect(current_path).to eq("/pets/#{buster.id}/edit")

    fill_in 'image', with: 'https://static.wixstatic.com/media/1910c7_39074bddb42b41d59059c9738a7a8306f000.jpg/v1/fill/w_640,h_776,al_c,q_85,usm_0.66_1.00_0.01/1910c7_39074bddb42b41d59059c9738a7a8306f000.webp'
    fill_in 'name', with: 'Bentley'
    fill_in 'description', with: 'High energy'
    fill_in 'approximate_age', with: '8'
    fill_in 'sex', with: 'male'

    click_button 'Submit'
    expect(current_path).to eq("/pets/#{buster.id}")
  end
end
