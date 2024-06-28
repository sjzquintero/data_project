class SearchController < ApplicationController
  def search
    @query = params[:query]

    if @query.present?
      @cocktails = Cocktail.where("cocktails.name LIKE ?", "%#{@query}%")

      @meals = Meal.where("meals.name LIKE ?", "%#{@query}%")

      @ingredients = Ingredient.where("ingredients.name LIKE ?", "%#{@query}%")

      @results = (@cocktails + @meals + @ingredients).uniq
    else
      @results = []
    end

    render 'search/results'
  end
end
