class MealsController < ApplicationController
  
  def index
    @meals = Meal.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    Meal.create(meal_params)
   
  end
  
  private
  def meal_params
    params.permit(:name, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

