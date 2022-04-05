Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  root "home#index"
    
    get '/login'     => 'sessions#new'
	
  	post '/login'    => 'sessions#create'
	
  	delete '/logout' => 'sessions#destroy'  

    get '/profile' => 'profile#index'

    resources :users do 
      resources :ratings
      resources :skills
    end 

    

    resources :tasks do 
      resources :addresses
      resources :participants
      resources :submissions
    end

    resources :posts do 
      resources :likes
      resources :comments
    end

end
