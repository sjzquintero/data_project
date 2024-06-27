class MealIngredient < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient

  validates :meal_id, presence: true
  validates :ingredient_id, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["ingredient", "meal"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "ingredient_id", "meal_id", "updated_at"]
  end
end
