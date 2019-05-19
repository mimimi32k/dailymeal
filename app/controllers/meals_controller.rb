class MealsController < ApplicationController
  
  def index
    @meals = Meal.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    Meal.create(name: meal_params[:name], image: meal_params[:image], text: meal_params[:text], user_id: current_user.id)
  end
  
  private
  def meal_params
    params.permit(:name, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

