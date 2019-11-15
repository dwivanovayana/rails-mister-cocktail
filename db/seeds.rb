require 'json'
require 'open-uri'

puts 'Cleansing Datebase...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

require 'open-uri'
require 'json'
records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
records["drinks"].each do |record|
  Ingredient.create!(name: record["strIngredient1"])
end

puts 'Creating Cocktails...'
Cocktail.create(name: "Mojito")
Cocktail.create(name: "Lion King")
puts 'Finished!'
