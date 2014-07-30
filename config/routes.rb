Pandatanet::Application.routes.draw do
  resources :contraloria, only: [:index,:show]
  resources :proveedores , only: [:index,:show]
  resources :owner_brands

  resources :owners

  resources :asociations, only: [:index,:show]

  resources :personas, only: [:index,:show]

  resources :licitations, only: [:index,:show], path: 'licitaciones'

  resources :corporations, only: [:index,:show], path: 'sociedades'
  resources :brands, only: [:index,:show], path: 'marcas'
  resources :owners, only: [:index,:show]


  root :to => "home#index"
  match '/about' => 'home#about', via: :get
  match '/about' => 'home#about', via: :get
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  get "/sitemap" => redirect("https://s3.amazonaws.com/panadata/sitemaps/sitemap.xml.gz")
end
