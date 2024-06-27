class Meal < ApplicationRecord
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients

  validates :name, presence: true, uniqueness: true
  validates :instructions, presence: true
  validates :category, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["category", "created_at", "id", "id_value", "instructions", "name", "updated_at"]
  end
end
