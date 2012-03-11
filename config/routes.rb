Hostelapp::Application.routes.draw do

  devise_for :users

  get "search/results"
  
  get "search/postresults"
  
  get "/:id/results/" => 'search#show'
  
  post "search/results"
  
  post "/:id/results" => 'search#show'
  
  get "/:id/booking" => 'search#booking'
  
  get "/:id/payment" => 'search#payment'
  
  get "/:id/confirmation" => 'search#confirmation'
  
  
  resources :cities
  

  resources :hotels

  get "pages/home"

  get "pages/contact"

  get "pages/about"
  
  get "pages/new_search"
  
  root :to => "pages#home"

  
 
end
