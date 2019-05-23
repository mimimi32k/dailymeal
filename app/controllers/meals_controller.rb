class MealsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @meals = Meal.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  
  def new
  end
  
  def create
    Meal.create(image: meal_params[:image], text: meal_params[:text], user_id: current_user.id)
  end
  
  def destroy
    meal = Meal.find(params[:id])
    if meal.user_id == current_user.id
      meal.destroy
    end
  end
  
  def edit
    @meal = Meal.find(params[:id])
  end
  
  def update
    meal = Meal.find(params[:id])
    if meal.user_id == current_user.id
      meal.update(meal_params)
    end
  end
  
  def show
    @meal = Meal.find(params[:id])
    @comments = @meal.comments.includes(:user)
  end
  
  private
  def meal_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

