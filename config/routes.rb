Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/auth"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :things
    resources :users
    put "basic_upload", to: "users#basic_upload"
    put "update_user_imagine", to: "users#update_user_imagine"
    post "create_post", to: "users#create_a_post"
  end
end
