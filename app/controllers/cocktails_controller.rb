class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
