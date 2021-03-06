require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :approximate_age }
    it { should validate_presence_of :description }
    it { should validate_presence_of :shelter }
    it { should validate_presence_of :adoptable }
    it { should validate_presence_of :image }
  end

  describe "relationships" do
    it {should belong_to :shelter}
  end
end
