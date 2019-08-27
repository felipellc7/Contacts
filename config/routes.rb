Rails.application.routes.draw do
	post 'users/sign_up', to: 'users#sign_up'
	post 'users/sign_in', to: 'users#sign_in'
	get 'users/other', to: 'users#other'
end
