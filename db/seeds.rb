require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

Cocktail.create!(name: "Mojito")
Cocktail.create!(name: "Cuba Libre")
Cocktail.create!(name: "Spritz")


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_list = open(url).read
list = JSON.parse(ingredients_list)

list['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

Dose.create!(description: "5cl", ingredient: Ingredient.first, cocktail: Cocktail.first)
Dose.create!(description: "10 cl", ingredient: Ingredient.second, cocktail: Cocktail.first)
Dose.create!(description: "12 g", ingredient: Ingredient.last, cocktail: Cocktail.first)
