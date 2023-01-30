Rails.application.routes.draw do
  
  
  scope module: 'public' do
    get root to: "homes#top"
    get 'homes/about', as: :about
    
    get 'customers/sign_up' => 'registrations#new' 
    get 'customers' => 'registrations#create' 
    
    get 'customers/sign_in' => 'sessions#new'
    get '/customers/sign_out' => 'sessions#destroy'
    
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#confirm'
    
    resources :orders, only: [:new,:confirm,:complete,:index,:show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    
    resources :cart_items, only: [:index,:destroy] do
       collection do
         get 'destroy_all'
       end
     end
    
    resources :items, only: [:index,:show]
    resources :addresses,only: [:index,:edit,:create,:update,:destroy]
  end
  
  
  namespace :admin do
    get root to: "homes#top"
    
    resources :orders, only: [:show]
    resources :customers, only: [:index,:show,:edit]
    resources :items, only: [:index,:new,:show,:edit]
  end
  
  
  
  devise_for :customers,skip: [:passwords],controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin,skip: [:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
