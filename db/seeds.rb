# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Image.destroy_all

waldo = Image.create(name: 'Waldo', file: 'waldo.jpg', height: 10, width: 21)
waldo.targets.create(
  [{ name: 'Waldo', file: 'waldo/waldo.png', row: 2, column: 3 },
   { name: 'Wallo', file: 'waldo/wallo.png', row: 6, column: 7 },
   { name: 'Doggo', file: 'waldo/doggo.png', row: 9, column: 10 },
   { name: 'Payo', file: 'waldo/payo.png', row: 8, column: 3 },
   { name: 'Saleso', file: 'waldo/saleso.png', row: 0, column: 14 },
   { name: 'Spotto', file: 'waldo/spotto.png', row: 4, column: 11 }]
)

toy_city = Image.create(name: 'Toy City', file: 'toy-city.png', height: 18, width: 16)
toy_city.targets.create(
  [{ name: 'White van', file: 'toy-city/white-van.png', row: 9, column: 0 },
   { name: 'Cat', file: 'toy-city/cat.png', row: 10, column: 13 },
   { name: 'Group of three people', file: 'toy-city/group-of-three-people.png', row: 9, column: 4 },
   { name: 'Roller skate', file: 'toy-city/roller-skate.png', row: 12, column: 13 },
   { name: 'Blue van with mouse', file: 'toy-city/blue-mouse-van.png', row: 13, column: 9 },
   { name: 'Apple', file: 'toy-city/apple.png', row: 4, column: 15 },
   { name: 'Safety pin', file: 'toy-city/safety-pin.png', row: 8, column: 12 },
   { name: 'Chapel', file: 'toy-city/chapel.png', row: 9, column: 7 }]
)

flamingos = Image.create(name: 'Flamingos', file: 'flamingos.jpg', height: 17, width: 15)
flamingos.targets.create(
  [{ name: 'Goofy flamingo face', file: 'flamingos/goofy-flamingo-face.png', row: 0, column: 7 },
   { name: 'TY tag', file: 'flamingos/ty-tag.png', row: 11, column: 9 },
   { name: '"Select"', file: 'flamingos/select.png', row: 8, column: 8 },
   { name: 'Cup', file: 'flamingos/cup.png', row: 12, column: 13 },
   { name: '$5', file: 'flamingos/5-dollars.png', row: 13, column: 1 },
   { name: 'Shell', file: 'flamingos/shell.png', row: 3, column: 11 }]
)

artsy_metropolis = Image.create(name: 'Artsy Metropolis', file: 'artsy-metropolis.jpg', height: 10, width: 14)
artsy_metropolis.targets.create(
  [{ name: 'Clock', file: 'artsy-metropolis/clock.png', row: 1, column: 5 },
   { name: 'Bus', file: 'artsy-metropolis/bus.png', row: 4, column: 11 },
   { name: 'Umbrella', file: 'artsy-metropolis/umbrella.png', row: 7, column: 4},
   { name: 'Dog', file: 'artsy-metropolis/dog.png', row: 1, column: 8 },
   { name: 'Boat', file: 'artsy-metropolis/boat.png', row: 9, column: 6 },
   { name: 'Carousel', file: 'artsy-metropolis/carousel.png', row: 6, column: 11 },
   { name: 'Star', file: 'artsy-metropolis/star.png', row: 9, column: 4 },
   { name: 'Rainbow', file: 'artsy-metropolis/rainbow.png', row: 3, column: 5 }]
)
