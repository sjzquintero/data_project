require 'net/http'
require 'json'

class CocktailSyncService
  BASE_URL = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?f='
  RESULTS_LIMIT = 5

  def self.sync
    ('a'..'z').each do |letter|
      response = Net::HTTP.get(URI("#{BASE_URL}#{letter}"))
      data = JSON.parse(response)
      next unless data['drinks']

      data['drinks'].first(RESULTS_LIMIT).each do |drink|
        cocktail = Cocktail.find_or_create_by(name: drink['strDrink']) do |c|
          c.instructions = drink['strInstructions']
          c.glass = drink['strGlass']
        end

        (1..15).each do |i|
          ingredient_name = drink["strIngredient#{i}"]
          next if ingredient_name.blank?

          ingredient = Ingredient.find_or_create_by(name: ingredient_name)
          CocktailIngredient.find_or_create_by(cocktail: cocktail, ingredient: ingredient)
          puts "Added Ingredient '#{ingredient.name}' to Cocktail '#{cocktail.name}'"
        end
      end
    end
  end
end
