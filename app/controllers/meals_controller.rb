class MealsController < ApplicationController
  def index
    @meals = Meal.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @meal = Meal.find(params[:id])
  end
end
