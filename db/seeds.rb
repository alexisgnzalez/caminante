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
