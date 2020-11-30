require 'json'
require 'open-uri'
require 'faker'

puts 'Cleansing Datebase...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all
Review.destroy_all

puts 'Creating 20 fake cocktails...'
20.times do
  cocktail = Cocktail.new(
    name:    Faker::Company.name,
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
