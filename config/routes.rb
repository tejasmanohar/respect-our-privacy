Rails.application.routes.draw do
  root :to => 'home#index'

  # phones
  post 'phones/create' => 'phones#create'
  post 'phones/voice' => 'phones#voice'
end
