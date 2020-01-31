class Pet < ApplicationRecord
  validates_presence_of :name,
                       :sex,
                       :approximate_age,
                       :description,
                       :shelter,
                       :adoptable,
                       :image
  belongs_to :shelter
end
