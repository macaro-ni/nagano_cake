Rails.application.routes.draw do
  
  
  scope module: 'public' do
    get root to: "homes#top"
    get 'homes/about', as: :about
    
    get '/customers/sign_up' => 'registrations#new' ,as: :new_customer
    
    get '/customers/sign_in' => 'sessions#new',as: :new_sesstion
    
    get 'customers/my_page' => 'customers#show', as: :customer
    get 'customers/information/edit' => 'customers#edit',as: :edit_customer
    get 'customers/unsubscribe' => 'customers#confirm',as: :confirm_customer
    
    resources :orders, only: [:new,:confirm,:complete,:index,:show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :cart_items, only: [:index]
    #resources :customers, only: [:show,:edit,:confirm] ->これは上に個別でルートの指定をした。
    resources :items, only: [:index,:show]
    resources :addresses,only: [:index,:edit,:create,:update,:destroy]
  end
  
  namespace :admin do
    get root to: "homes#top"
    resources :sessions, only: [:new,:create,:destroy]
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
