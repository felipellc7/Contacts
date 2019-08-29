Rails.application.routes.draw do
  post 'users/sign_up', to: 'users#sign_up'
  post 'users/sign_in', to: 'users#sign_in'
  get 'users/sign_out', to: 'users#sign_out'
  get 'profile', to: 'users#profile'
  put 'profile', to: 'users#update_profile'
  put 'profile/photo', to: 'users#update_profile_photo'
  resources :contacts
end
