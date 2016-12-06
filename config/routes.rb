Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	resources :sessions, only: [:new, :create] do
		delete :destroy, on: :collection
	end
	
    resources :users, only: [:new, :create]
	resources :episodes
    #home page
    root "home#index"


end
