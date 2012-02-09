Hostelapp::Application.routes.draw do

  get "search/results"
  
  post "search/results"

  resources :hotels

  get "pages/home"

  get "pages/contact"

  get "pages/about"
  
  get "pages/new_search"
  
  root :to => "pages#home"

 
end
