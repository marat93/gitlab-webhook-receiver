Rails.application.routes.draw do
  post 'authentication/login'
  get 'authentication/info'

  resource :image, only: :show
end
