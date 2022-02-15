Rails.application.routes.draw do
resources :books



  root 'home#index'
  devise_for :authers 
  devise_scope :auther do
    get '/authers/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
