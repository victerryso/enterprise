Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :revisions
  resources :documents do 
   collection do
    get :export
     end
   end

  resources :posts do
  resources :comments
end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end