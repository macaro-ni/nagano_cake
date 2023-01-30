Rails.application.routes.draw do
  
  
  scope module: 'public' do
    #homes
    get root to: "homes#top"
    get 'homes/about', as: :about
    
    #registrationsは下に記述済
    #get 'customers/sign_up' => 'registrations#new' 
    #post 'customers' => 'registrations#create' 
    
    #sesstionsは下に記述済
    #get 'customers/sign_in' => 'sessions#new'
    #post 'customers/sign_in' => 'sessions#create'
    #delete 'customers/sign_out' => 'sessions#destroy'
    
    #customers
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#confirm'
    patch '/customers/withdraw' => 'customers#withdraw'
    
    #cart_items
    resources :cart_items, only: [:index,:destroy] do
       collection do
         get 'destroy_all'
       end
     end
     
    #orders
    resources :orders, only: [:new,:confirm,:complete,:create,:index,:show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    
    resources :items, only: [:index,:show]
    resources :addresses,only: [:index,:edit,:create,:update,:destroy]
  end
  
  
  namespace :admin do
    get root to: "homes#top"
    
    #sessionsは下に記述済
    resources :orders, only: [:show,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
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
