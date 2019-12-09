require 'json'
require 'open-uri'

puts 'Cleansing Datebase...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating ingredients...'
records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
records["drinks"].each do |record|
  i = Ingredient.create!(name: record["strIngredient1"])
  puts "create#{i.name}"
end

puts 'Finished!'
