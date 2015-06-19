Rails.application.routes.draw do
  root :to => 'phones#new'
  get '/emails' => 'emails#new'
end
