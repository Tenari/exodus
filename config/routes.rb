Rails.application.routes.draw do
  resources :ascetic_plans
  resources :ascetic_practices
  root to: 'main#home'
  get '/details/:date', to: 'main#details'
  post '/reading/:date', to: 'main#update_reading'
  post '/update_ascetic_plans', to: 'main#update_ascetic_plans'

end
