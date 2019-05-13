class MealsController < ApplicationController
  
  def index
    @meals = Meal.all
  end
  
  def new
  end
  
end
