Rails.application.routes.draw do

  root :to => 'home#index'

  resources :traps, only: [:index] do
    resources :requests, only: [:index, :show]
  end

  controller :capture_requests do
    match '/:trap_id/*dynamic' => :create, via: :all, constraints: lambda {|request| request.params[:trap_id] != 'websocket'}
  end

end
