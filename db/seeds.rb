require 'json'
require 'open-uri'
require 'faker'

puts 'Cleansing Datebase...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating 30 fake cocktails...'
30.times do
  cocktail = Cocktail.new(
    name:    Faker::Company.name,
    photo:  '/images/cocktail.jpg'
  )
  cocktail.save!
end
puts 'Finished!'

puts 'Creating ingredients...'
records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
records["drinks"].each do |record|
  i = Ingredient.create!(name: record["strIngredient1"])
  puts "create#{i.name}"
end

puts 'Finished!'
