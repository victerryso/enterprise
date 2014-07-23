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

  get '/about' => 'pages#about', :as => :about
  get '/contact' => 'pages#contact', :as => :contact
  get '/employees' => 'pages#employees', :as => :employees
  get '/info' => 'pages#info', :as => :info

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end