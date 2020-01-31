require 'rails_helper'

RSpec.describe 'As a visitor, I can create a new shelter from the index page' do
  it 'has a link to a form for a new shelter' do
    visit '/shelters'

    click_link 'Create new shelter'
    expect(current_path).to eq('/shelters/new')

    fill_in 'name', with: 'No pet left behind'
    fill_in 'address', with: '103 breaking ball st'
    fill_in 'city', with: 'Saint Louis'
    fill_in 'state', with: 'Missouri'
    fill_in 'zip', with: '63366'

    click_button('Submit')

    expect(current_path).to eq('/shelters')
    expect(page).to have_content('No pet left behind')
  end
end
