Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      post 'authentication/login'
      get 'authentication/info'

      resource :image, only: :show
    end
  end
end
