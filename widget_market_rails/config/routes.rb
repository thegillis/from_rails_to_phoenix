Rails.application.routes.draw do

  root 'home#show'

  namespace :v1 do
    resources :widgets
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
