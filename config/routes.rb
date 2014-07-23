Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :revisions, :posts
  resources :documents do
    collection do
      get :export
    end
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end