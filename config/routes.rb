Rails.application.routes.draw do
  # devise_for :users
  namespace :api do
  	namespace :v1 do

  		devise_for :users, :controller => { :sessions => 'sessions', :registrations => 'registrations' }
  		resources :events do
        get :rsvp_count, on: :member
        get :rsvp_cancelled_count, on: :member
        get :interested_users, on: :member
        get :cancelled_users, on: :member
        get :add_user_to_confirmed_attendees, on: :member
  			put :remove_user_from_confirmed_attendees, on: :member
        get :my_calendar, on: :collection
  		end
  		resources :users
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
