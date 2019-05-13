Rails.application.routes.draw do
  get 'meals' => 'meals#index' 
  get  'meals/new'  =>  'meals#new'       #ツイート投稿画面# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
