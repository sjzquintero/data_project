class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients

  validates :name, presence: true, uniqueness: true
  validates :instructions, presence: true
  validates :glass, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "glass", "id", "id_value", "instructions", "name", "updated_at"]
  end
end
