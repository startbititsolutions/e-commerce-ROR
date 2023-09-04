# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fruit_names = [
  "Apple",
  "Banana",
  "Cherry",
  "Grapes",
  "Orange",
  "Peach",
  "Pear",
  "Pineapple",
  "Strawberry",
  "Watermelon"
]
require 'faker'

20.times do
    Productdetail.create!(
      product_title: "#{fruit_names.sample} #{Faker::Commerce.product_name}",
      brand: Faker::Company.name,
      price: Faker::Commerce.price(range: 10.0..100.0, as_string: false),
      list_price: Faker::Commerce.price(range: 10.0..100.0, as_string: false),
      description: Faker::Lorem.paragraph,
      sku: Faker::Alphanumeric.alphanumeric(number: 10),
      tags: Faker::Lorem.words(number: 3).join(', '),
      product_type: Faker::Commerce.department,
      status: Faker::Boolean.boolean,
      meta_title: Faker::Lorem.sentence,
      meta_description: Faker::Lorem.paragraph,
      vendor_id:5,
      image: Faker::Placeholdit.image(size: '200x200'),
      currency: Faker::Currency.code,
      feature_image_id:nil,
      inventory: rand(0..1000)
    )
  end