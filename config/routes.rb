Rails.application.routes.draw do
  root 'photo#index'
  get 'photo/index'
  post 'photo/store'
  post 'photo/destroy'
end
