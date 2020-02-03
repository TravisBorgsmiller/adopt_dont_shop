require 'rails_helper'

RSpec.describe 'As a visitor when I visit shelter pets index' do
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

    @bruce = @trav_shelter.pets.create(name: 'Bruce',
                              description: 'Loyal',
                              approximate_age: 8,
                              sex: 'male',
                              adoptable: 'adoptable',
                              image: 'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg&w=767')
end
  it 'shows me all the pets in that shelter' do

    visit "/shelters/#{@trav_shelter.id}/pets"
    expect(current_path).to eq("/shelters/#{@bruce.shelter_id}/pets")

    expect(page).to have_content(@bruce.name)
    expect(page).to have_css("img[src*='https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg&w=767']")
    expect(page).to have_content(@bruce.sex)
    expect(page).to have_content(@buster.name)
    expect(page).to have_content(@buster.approximate_age)
    expect(page).to have_content(@buster.sex)
    expect(page).to_not have_content(@fido.name)
  end

  it 'shows count of all pets in shelter' do
    visit "/shelters/#{@trav_shelter.id}/pets"
    expect(current_path).to eq("/shelters/#{@bruce.shelter_id}/pets")

    expect(page).to have_content('Number of pets in shelter: 2')
  end 
end
