Rails.application.routes.draw do

  get 'request/show'

  controller :traps do
    get '/traps' => :index
    match '/traps/:trap_id' => :capture_request, via: :all
    get '/traps/:trap_id/requests' => :show

    controller :request do
      get '/traps/:trap_id/requests/:id' => :show
    end
  end

end
