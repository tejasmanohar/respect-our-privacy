Rails.application.routes.draw do
  root :to => 'home#index'

  # phones
  post 'phones/create' => 'phones#create'
  post 'phones/voice' => 'phones#voice'

  post 'emails/create' => 'emails#create'
end
