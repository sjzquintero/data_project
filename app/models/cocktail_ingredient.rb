class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true

end
