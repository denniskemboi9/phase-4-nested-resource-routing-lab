Rails.application.routes.draw do
  resources :items do
    resources :user
  end
  
  resources :users do 
    resources :items
  end
end
