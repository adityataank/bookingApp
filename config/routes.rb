Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :bookings
  get "/admin", to: "admins#home"
  get "/admin/users", to: "admins#users"
  get "/admin/users/show/:id(.:format)", to: "admins#show", as: 'admin_users_show'
  match '/users/:id' => 'admins#destroy', :via => :delete, :as => :admin_destroy_user
  get "/booking/download/:id(.:format)", to: "bookings#download_pdf", as: 'download_pdf'
end
