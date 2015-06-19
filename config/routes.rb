Rails.application.routes.draw do
  root :to => 'phones#new'

  # phones
  post 'phones/create' => 'phones#create'
end
