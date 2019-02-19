# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'nokogiri'

puts 'cleaning DB'

User.destroy_all

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    first_name:  Faker::Name.first_name,
    last_name:   Faker::Name.last_name,
    email:       Faker::Internet.free_email,
    password:    Faker::Internet.password(10, 20)
  )
  user.save!
end

puts 'Finished!'

puts 'Creating 10 fake boats...'

url = "https://www.clickandboat.com/location-bateau/recherche?where=Gen%C3%A8ve,%20Suisse&DateDebut=&DateFin=&ProduitTypeId=&_tri=Selection&TypeNavigation=With%20or%20without%20captain&_page=1"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# html_doc.search('.itemProduct').each do |element|
  # name = element.attr('alt')
  # category = element.attr('data-type-boat')
  # price_per_day = element.attr('data-prix-jour-acl')
  # picture = element.attr('src')
  # image_url = element.attr('src')
  # image_url = element.attr('src')
  # boat = Boat.create!(name: name, category: category, price_per_day: price_per_day, user_id: 1)


html_doc.search('.itemCap').each do |element|
  name_boat = element.attr('h3')
  boat = Boat.create!(name: name_boat, user_id: 1)
end




puts 'Finished!'
