Rails.application.routes.draw do



		

  root "home#index"
  get "/auth/:provider/callback" => "user_sessions#create"
  get 'create_session' => 'user_sessions#create'
  get "/signout" => "user_sessions#destroy", :as => :signout




	resources :workouts
	resources :exercises
	
    # root 'workouts#index'

   end