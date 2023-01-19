# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Image.destroy_all

waldo = Image.create(file: 'waldo.jpg', height: 10, width: 21)
waldo.targets.create(
  [{ name: 'Waldo', file: 'waldo/waldo.png', row: 2, column: 3 },
   { name: 'Doggo', file: 'waldo/doggo.png', row: 9, column: 10 },
   { name: 'Payo', file: 'waldo/payo.png', row: 8, column: 3 },
   { name: 'Saleso', file: 'waldo/saleso.png', row: 0, column: 14 },
   { name: 'Spotto', file: 'waldo/spotto.png', row: 4, column: 11 },
   { name: 'Wallo', file: 'waldo/wallo.png', row: 6, column: 7 }]
)
