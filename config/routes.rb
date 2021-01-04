Rails.application.routes.draw do
  root to: 'cities#index' # root route of the application
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do  
    get '/users/sign_out', to: 'devise/sessions#destroy'  
  end
  
  resources :employees # to route all crud operation
  resources :cities  # to route all crud operation 
  
  get "managers", to: "employees#show_manager" #create route to show managers 
  get "count", to: "employees#cityemp" # to count the the no. of employee in particular city
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
 