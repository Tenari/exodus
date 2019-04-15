Rails.application.routes.draw do
  resources :ascetic_plans
  resources :ascetic_practices
  root to: 'main#home'
  get '/details/:date', to: 'main#details'

end
