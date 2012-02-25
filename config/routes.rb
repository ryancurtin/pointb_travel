Hostelapp::Application.routes.draw do

  get "search/results"
  
  get "search/postresults"
  
  get "/:id/results/" => 'search#show'
  
  post "search/results"
  
  post "/:id/results" => 'search#show'
  
  get "/:id/booking" => 'search#booking'
  
  
  resources :cities
  

  resources :hotels

  get "pages/home"

  get "pages/contact"

  get "pages/about"
  
  get "pages/new_search"
  
  root :to => "pages#home"

  
 
end
