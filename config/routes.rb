Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :documents, :revisions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end