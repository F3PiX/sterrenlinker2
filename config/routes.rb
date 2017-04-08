Rails.application.routes.draw do

  root to: 'link_requests#index'
  resources :link_requests do
    resources :sterrenlinks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
