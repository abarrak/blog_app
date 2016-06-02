Rails.application.routes.draw do
  # root route
  root "welcome#index"

  # static pages named routes
  get 'contact' => 'welcome#contact'
  get 'help' => 'welcome#help'
end
