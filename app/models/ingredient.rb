class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :cocktails, through: :cocktail_ingredients
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients

  validates :name, presence: true, uniqueness: true
end
