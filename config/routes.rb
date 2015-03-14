Rails.application.routes.draw do

  root :to => 'home#index'

  resources :traps, only: [:index] do
    resources :requests, only: [:index, :show]
  end

  controller :capture_requests do
    match '/:trap_id' => :create, via: :all
  end

end
