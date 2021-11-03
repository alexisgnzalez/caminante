# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all locations"
Location.delete_all
puts "Deleting all tours"
Tour.delete_all
puts "All tours deleted"
puts "Getting first user from db"
alexis = User.first

puts "creating tours"
10.times do |index|
  tour = Tour.create(
    name: "Centro de Caracas",
    description: "Probarás la mejor combinación de Golfeado con café artesanal de la ciudad, podrás interactuar con las ardillas negras en la Plaza Bolívar, luego puedes elegir comer una exquisita cocada para luego conocer a Simón Bolívar en su propia casa en la última parada del tour.",
    rating: 5,
    long: -66.9138514995575,
    lat: 10.50538701033651,
    user: alexis
  )
  puts "Created tour #{index}"
  Location.create(
    name: "Café Artesanos",
    description: "Sandwiches con charcutería de la casa, vino de mora, café artesanal con licor, ambiente vintage agradable y le mejor golfeado de Venezuela, qué más puedes pedir?",
    long: -66.91407144069672,
    lat: 10.50538701033651,
    tour: tour
  )
  Location.create(
    name: "Plaza Bolívar",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    long: -66.91462934017181,
    lat: 10.505998851547064,
    tour: tour
  )
  Location.create(
    name: "Super Cocadas",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    long: -66.91357791423798,
    lat: 10.505292069350423,
    tour: tour
  )
  Location.create(
    name: "Casa de Bolívar",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    long: -66.91317021846771,
    lat: 10.50458264828097,
    tour: tour
  )
  puts "Created locations for tour #{index}"
end
