class Routes < NetMate::Routing
  def create_routes
    get 'posts/new'
    match '/', to: 'posts#create', via: 'post'
    match '/', to: 'posts#index', via: 'get'
    match 'post/details', to: 'posts#details', via: 'get'
    post 'comments/create'
    #match 'signup', to: 'controller#new', via: 'get'
    #resources :sessions,     only: [:new, :create]
  end
end
