Rails.application.routes.draw do
  # root route
  root "welcome#index"

  # static pages named routes
  get 'contact' => 'welcome#contact'
  get 'help' => 'welcome#help'

  # posts REST routes
  resources :posts do
    resources :comments
  end

  # devise routes
  devise_for :users
end
