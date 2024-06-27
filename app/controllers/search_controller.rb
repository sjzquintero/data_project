# app/controllers/search_controller.rb
class SearchController < ApplicationController
  def search
    @query = params[:query]

    # Lógica de búsqueda para cocktails
    @cocktails = Cocktail.where("cocktails.name LIKE ?", "%#{@query}%")


    # Lógica de búsqueda para meals
    @meals = Meal.where("meals.name LIKE ?", "%#{@query}%")


    # Lógica de búsqueda para ingredients
    @ingredients = Ingredient.where("ingredients.name LIKE ?", "%#{@query}%")

    # Asignar resultados combinados
    @results = @meals + @cocktails + @ingredients

    # Renderizar la vista de resultados de búsqueda
    render 'search/results'
  end
end
