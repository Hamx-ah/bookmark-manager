Rails.application.routes.draw do
post "/login", to: "users#login", as: :login_user
get "/logout", to: "users#logout", as: :logout_user
get "/marks/search/", to: "marks#search_by_title", as: :search_by_title
get "/marks/filter/", to: "marks#search_by_filter", as: :search_by_filter
resources :users, :marks
root "users#index"
end
