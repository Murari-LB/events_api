Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
  	namespace :v1 do

  		devise_for :users, :controller => { :sessions => 'sessions', :registrations => 'registrations' }
  		resources :events
  		resources :users
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
