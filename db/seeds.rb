# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

open(Rails.root.join('db/1.1.sozzler'), 'rb') do |f|
  recipe_dicts = JSON.parse(f.read)

  recipe_dicts.each do |rd|
    recipe = Recipe.new name: rd['name'],
                        text: rd['text'],
                        rating: rd['rating']

    rd['components'].each do |c|
      unit = Unit.find_or_create_by(name: c['unit'])
      ingredient = Ingredient.find_or_create_by(name: c['ingredient'])

      recipe.components.build(unit: unit, ingredient: ingredient, quantity: c['quantity'], index: c['index'])
    end

    recipe.save!

  end
end