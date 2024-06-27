class SearchController < ApplicationController
  def search
    @query = params[:query]


    @cocktails = Cocktail.where("cocktails.name LIKE ?", "%#{@query}%")
                         .or(Cocktail.where("cocktails.instructions LIKE ?", "%#{@query}%"))
                         .joins(:ingredients).where("ingredients.name LIKE ?", "%#{@query}%")
                         .distinct

    @meals = Meal.where("meals.name LIKE ?", "%#{@query}%")
                 .or(Meal.where("meals.instructions LIKE ?", "%#{@query}%"))
                 .joins(:ingredients).where("ingredients.name LIKE ?", "%#{@query}%")
                 .distinct

    @ingredients = Ingredient.where("ingredients.name LIKE ?", "%#{@query}%")

    @results = @cocktails + @meals + @ingredients

    # Renderizar la vista de resultados de búsqueda
    render 'search/results'
  end
end
