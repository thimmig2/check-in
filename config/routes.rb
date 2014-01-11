AkpsiPoints::Application.routes.draw do
  resources :checkins do 
    get :autocomplete_event_name, on: :collection
    get :autocomplete_user_name, on: :collection
  end

  resources :events

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users
end