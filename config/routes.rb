Rails.application.routes.draw do
  resource :trigger, only: [:create]
end
