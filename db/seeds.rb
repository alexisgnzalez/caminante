# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'faker'
require "open-uri"

puts "Deleting Bookings"
Booking.delete_all

puts "Deleting Locations"
Location.delete_all

puts "Deleting Tours"
Booking.delete_all

tour_names = ["Centro de Caracas", "Los Proceres", "Hotel Humboldt", "Parque del Este"]
location_names = ["Cafetería Las Tazas", "Plaza Cuadrada", "Bar Bebidas Espirituosas", "La Casa Embrujada"]
longs = [-66.9140875339508, -66.91419214010239, -66.91362619400024, -66.91317021846771]
lats = [10.506518388175483, 10.505898636259351, 10.505313167349858, 10.5045536384628]

foto_1 = 'https://res.cloudinary.com/alexisgonzalez/image/upload/v1634931412/sample.jpg'
foto_2 = 'https://res.cloudinary.com/alexisgonzalez/image/upload/v1634933354/scivhr1lvvkqpws3wge5.jpg'
model_3d = 'https://res.cloudinary.com/alexisgonzalez/image/upload/v1636123660/anei6uohbavrmewctids.glb'

4.times do |index|
  puts "Making #{index +1} tour"
  tour = Tour.create(
    name: tour_names[rand(0..3)],
    description: Faker::Lorem.paragraph,
    rating: rand(3..5),
    long: -66.9138514995575,
    lat: 10.50538701033651,
    user_id: 1
  )
  tour.photos.attach(io: URI.open(foto_1), filename: "Picture1", content_type: 'image/jpg')
  # tour.photos.attach(io: URI.open(fotos[rand(0..5)]), filename: "Picture2", content_type: 'image/jpg')
  # tour.photos.attach(io: URI.open(fotos[rand(0..5)]), filename: "Picture3", content_type: 'image/jpg')

  4.times do |i|
    puts "Making location #{i + 1} for tour #{index + 1}"
    location = Location.create(
      name: location_names[rand(0..3)],
      description: Faker::Lorem.paragraph,
      tour: tour,
      long: longs[i],
      lat: lats[i]
    )

    location.photos.attach(io: URI.open(foto_2), filename: "Picture1", content_type: 'image/jpg')
    # location.photos.attach(io: URI.open(fotos[rand(0..5)]), filename: "Picture2", content_type: 'image/jpg')
    # location.photos.attach(io: URI.open(fotos[rand(0..5)]), filename: "Picture3", content_type: 'image/jpg')
    location.model.attach(io: URI.open(model_3d), filename: "model1", content_type: 'image/glb')
  end

  puts "Making Booking #{index + 1} for tour #{index + 1}"
  Booking.create(
    user_id: 1,
    tour: tour
  )
end

puts "Done with the seeds dude!"







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# puts "Deleting all bookings"
# Booking.delete_all

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Deleting all locations"
# Location.delete_all
# puts "Deleting all tours"
# Tour.delete_all
# puts "All tours deleted"
# puts "Getting first user from db"
# alexis = User.first

# puts "creating tours"
# 10.times do |index|
#   tour = Tour.create(
#     name: "Centro de Caracas",
#     description: "Probarás la mejor combinación de Golfeado con café artesanal de la ciudad, podrás interactuar con las ardillas negras en la Plaza Bolívar, luego puedes elegir comer una exquisita cocada para luego conocer a Simón Bolívar en su propia casa en la última parada del tour.",
#     rating: 5,
#     long: -66.9138514995575,
#     lat: 10.50538701033651,
#     user: alexis
#   )
#   puts "Created tour #{index}"
#   Location.create(
#     name: "Café Artesanos",
#     description: "Sandwiches con charcutería de la casa, vino de mora, café artesanal con licor, ambiente vintage agradable y le mejor golfeado de Venezuela, qué más puedes pedir?",
#     long: -66.91407144069672,
#     lat: 10.50538701033651,
#     tour: tour
#   )
#   Location.create(
#     name: "Plaza Bolívar",
#     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#     long: -66.91462934017181,
#     lat: 10.505998851547064,
#     tour: tour
#   )
#   Location.create(
#     name: "Super Cocadas",
#     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#     long: -66.91357791423798,
#     lat: 10.505292069350423,
#     tour: tour
#   )
#   Location.create(
#     name: "Casa de Bolívar",
#     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#     long: -66.91317021846771,
#     lat: 10.50458264828097,
#     tour: tour
#   )
#   puts "Created locations for tour #{index}"
# end