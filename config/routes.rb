Rails.application.routes.draw do
  devise_for :users
  root  'meals#index'      #ルートパスの指定
  get   'meals'      => 'meals#index'       #ツイート一覧画面  
  get   'meals/new'  =>  'meals#new'        #ツイート投稿画面
  post  'meals'      =>  'meals#create'     #ツイート投稿機能#ツイート投稿画面
  get   'users/:id'   =>  'users#show'    #Mypageへのルーティング　　　　　　　　# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
