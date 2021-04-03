Rails.application.routes.draw do
  get '/api/v1/docs', to: redirect('https://documenter.getpostman.com/view/8307881/TzCP6nGp')

  post '/login', to: 'authentication#login'

  namespace :api do
    namespace :v1 do
      resources :patients, only: %i[create index update show]
      resources :users, only: %i[create index update]
      resources :roles, only: %i[create update index]
    end
  end

  get '*path', to: 'application#catch_all'
end
