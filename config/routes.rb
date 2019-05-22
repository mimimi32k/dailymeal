Rails.application.routes.draw do
  devise_for :users
  root  'meals#index'      #ルートパスの指定
  resources :meals                     #meals_controllerに対してのresourcesメソッド
  resources :meals do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド
end
