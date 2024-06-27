class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :cocktails, through: :cocktail_ingredients
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients

  validates :name, presence: true, uniqueness: true
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
