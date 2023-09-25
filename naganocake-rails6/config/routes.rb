Rails.application.routes.draw do
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
    resources :genres, except: [:destroy, :show, :new]
    resources :customers, except: [:destroy, :new, :create]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get "/search" => "items#search"
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    get "customers/information/edit" => "customers#edit"
    get "customers/my_page" => "customers#show"
    get "customers/confirm_withdraw" => "customers#confirm_withdraw"
    patch "customers/withdraw" => "customers#withdraw"
    patch "customers/information" => "customers#update"

    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, except: [:show, :edit, :new]
    resources :items, only: [:index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, except: [:update, :edit, :destroy]
    resources :addresses, except: [:show, :new]
    get "/search" => "intems#search"
  end
end
