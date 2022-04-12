Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  root "home#index"
    
    get '/login'     => 'sessions#new'
	
  	post '/login'    => 'sessions#create'
	
  	delete '/logout' => 'sessions#destroy'  

    get '/profile/:id' => 'profile#index'

    get '/rankings' => 'rankings#index'



    get "/admin" => "admin#index"
    get "/admin/users" => "admin#users"
    get "/admin/tasks/:id" => "admin#task"
    get "/admin/addTask" => "admin#add_task"
    get "/admin/updateTask/:id" => "admin#update_task"
    get "/admin/submissions/:id" => "admin#submission_info"
    get "/admin/userIdeas" => "admin#user_ideas"
    get "/admin/userIdeas/:id" => "admin#user_idea"


    resources :ideas
    
    
    resources :users do 
      patch "/disable" , to: "users#disable_user"
      
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
