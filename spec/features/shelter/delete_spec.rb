require 'rails_helper'

RSpec.describe 'As a visitor when visiting the shelter show page' do
  it 'has a link to delete shelter' do
    milly = Shelter.create(name: 'Milly',
                            address: '901 milly rock st',
                            city: 'Brooklyn',
                            state: 'New York',
                            zip: '90132')

    visit "/shelters/#{milly.id}"

    click_link "Delete #{milly.name}"
    expect(current_path).to eq("/shelters")
    expect(page).not_to have_content(milly.name)
  end
end
