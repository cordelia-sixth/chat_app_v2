Rails.application.routes.draw do
  root 'rooms#show'
  post '/rooms' => 'rooms#create'
end
