Rails.application.routes.draw do
  post 'authentication/login'
  get 'authentication/info'
end
