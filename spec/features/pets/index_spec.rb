require 'rails_helper'

RSpec.describe 'As a visitor, when I visit pet index page' do
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

    @buster = @trav_shelter.pets.create(name: 'Buster',
                              description: 'Friendly',
                              approximate_age: 3,
                              sex: 'male',
                              adoptable: 'adoptable',
                              image: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_2788,w_4960,x_0,y_255/f_auto,q_auto,w_1100/v1554918537/shape/mentalfloss/istock-488657289.jpg')

    @fido = @nelly_shelter.pets.create(name: 'Fido',
                              description: 'Sassy',
                              approximate_age: 7,
                              sex: 'female',
                              adoptable: 'adoptable',
                              image: 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg')
 end
  it 'shows all pets in the system with relevant information' do

    visit '/pets'
    expect(current_path).to eq('/pets')
    expect(page).to have_content(@buster.name)
    expect(page).to have_content(@buster.sex)
    expect(page).to have_content(@buster.approximate_age)
    expect(page).to have_content(@fido.name)
    expect(page).to have_content(@fido.sex)
    expect(page).to have_content(@fido.approximate_age)
    expect(page).to have_css("img[src*='https://images2.minutemediacdn.com/image/upload/c_crop,h_2788,w_4960,x_0,y_255/f_auto,q_auto,w_1100/v1554918537/shape/mentalfloss/istock-488657289.jpg']")
    expect(page).to have_css("img[src*='https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg']")
  end
  it 'has link to update pet from pet index page' do
    visit '/pets'
    expect(current_path).to eq('/pets')

    click_link "Update #{@fido.name}"
    expect(current_path).to eq("/pets/#{@fido.id}/edit")
  end
  it 'has link to delete pet from pet index page' do
    visit '/pets'
    expect(current_path).to eq('/pets')

    click_link "Delete #{@fido.name}"
    expect(current_path).to eq('/pets')
    expect(page).to_not have_content(@fido.name)
  end 

end
