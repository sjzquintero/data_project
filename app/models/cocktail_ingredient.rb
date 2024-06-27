class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient


  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true


  def self.ransackable_associations(auth_object = nil)
    ["cocktail", "ingredient"]
  end


  def self.ransackable_attributes(auth_object = nil)
    super + %w[cocktail_id ingredient_id]
  end
end
