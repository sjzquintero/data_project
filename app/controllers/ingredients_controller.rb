class IngredientsController < ApplicationController
  def index
    @ingredients =  Ingredient.order(:name).page(params[:page]).per(10)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
