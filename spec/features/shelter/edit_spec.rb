require 'rails_helper'

RSpec.describe 'As a visitor when I go to the shelter show page' do
  it 'has a link to update the shelter' do
    milly = Shelter.create(name: 'Milly',
                            address: '901 milly rock st',
                            city: 'Brooklyn',
                            state: 'New York',
                            zip: '90132')

    visit "/shelters/#{milly.id}"
    expect(current_path).to eq("/shelters/#{milly.id}")

    click_link "Update #{milly.name}"
    expect(current_path).to eq("/shelters/#{milly.id}/edit")

    expect(page).to have_field('Name', with: milly.name)
    expect(page).to have_field('Address', with: milly.address)
    expect(page).to have_field('City', with: milly.city)
    expect(page).to have_field('State', with: milly.state)
    expect(page).to have_field('Zip', with: milly.zip)

    fill_in 'Name', with: "Milly - The edited"
    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{milly.id}")
    expect(page).to have_content("Milly - The edited")
  end
end
