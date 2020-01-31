# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.delete_all
Shelter.delete_all 
trav_shelter = Shelter.create(name: 'Trav Shelter',
                              address: '10045 W grand',
                              city: 'Denver',
                              state: 'Colorado',
                              zip: '80603')

nelly_shelter = Shelter.create(name: 'Nelly Shelter',
                              address: '761 E Colfax',
                              city: 'Denver',
                              state: 'Colorado',
                              zip: '80602')

buster = trav_shelter.pets.create(name: 'Buster',
                          description: 'Friendly',
                          approximate_age: 3,
                          sex: 'male',
                          adoptable: 'adoptable',
                          image: 'https://images2.minutemediacdn.com/image/upload/c_crop,h_2788,w_4960,x_0,y_255/f_auto,q_auto,w_1100/v1554918537/shape/mentalfloss/istock-488657289.jpg')

fido = nelly_shelter.pets.create(name: 'Fido',
                          description: 'Sassy',
                          approximate_age: 7,
                          sex: 'female',
                          adoptable: 'adoptable',
                          image: 'https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg')
