# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all


Cat.create(name: "Sparkle", birth_date: "09/11/2014", 
  sex: "M", color: "Gray", description: "A silver classy tabby mix prone to long forays into the wild")

Cat.create(name: "Samantha", birth_date: "09/07/2014", 
  sex: "F", color: "Black", description: "Cuddly mother cat prone to leaping on your bed with her entire litter")

Cat.create(name: "Thomas O'Malley", birth_date: "05/11/2012", 
  sex: "M", color: "Orange", description: "A street-wise alley cat who lives with a bunch of jazz musicians")
  
Cat.create(name: "Mr. Mistofolees", birth_date: "10/09/2010", 
  sex: "M", color: "Calico", description: "A genuine cat magician capable of summoning several kittens from a hat")
