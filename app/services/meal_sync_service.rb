require 'net/http'
require 'json'

class MealSyncService
  BASE_URL = 'https://www.themealdb.com/api/json/v1/1/search.php?f='
  RESULTS_LIMIT = 5

  def self.sync
    ('a'..'z').each do |letter|
      response = Net::HTTP.get(URI("#{BASE_URL}#{letter}"))
      data = JSON.parse(response)
      next unless data['meals']

      data['meals'].first(RESULTS_LIMIT).each do |meal_data|
        meal = Meal.find_or_create_by(name: meal_data['strMeal']) do |m|
          m.instructions = meal_data['strInstructions']
          m.category = meal_data['strCategory']
        end

        (1..20).each do |i|
          ingredient_name = meal_data["strIngredient#{i}"]
          next if ingredient_name.blank?

          ingredient = Ingredient.find_or_create_by(name: ingredient_name)
          MealIngredient.find_or_create_by(meal: meal, ingredient: ingredient)
          puts "Added Ingredient '#{ingredient.name}' to Meal '#{meal.name}'"
        end
      end
    end
  end
end
