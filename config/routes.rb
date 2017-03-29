Rails.application.routes.draw do

  root 'welcome#index'
  get 'admin_panel', to: 'admin_panel#index'

  namespace :search do
    get 'autocomplete'
    get 'result'
  end

  namespace :admin_panel do
    get 'product_all'
    get 'seller_all'
    get 'categories'
    get 'twocategories'
    get 'threecategories'
    delete 'delete_attachment_product'
    delete 'delete_attachment_seller'
    delete 'delete_seller'
    delete 'delete_product'
    post 'form_render'
  end
  get 'admin_panel/:name/edit_seller', to: 'admin_panel#edit_seller', as: 'edit_seller_admin_panel'
  put 'admin_panel/:name/update_seller', to: 'admin_panel#update_seller', as: 'update_seller_admin_panel'
  get 'admin_panel/:name/edit_product', to: 'admin_panel#edit_product', as: 'edit_product_admin_panel'
  put 'admin_panel/:name/update_product', to: 'admin_panel#update_product', as: 'update_product_admin_panel'

  get '/about' => 'welcome#about'
  get '/vip' => 'welcome#vip'
  get '/comment' => 'welcome#comment'
  get 'seller_products/:id', to: 'welcome#seller_products', as: 'seller_products'


  get 'seller_panel/product'
  get 'seller_panel/vipstatus'
  get 'seller_panel/:name/showproduct', to: 'seller_panel#showproduct', as: 'showproduct_seller_panel'
  post 'seller_panel/product_visible'

  devise_for :sellers, controllers: {
      sessions: "sellers/sessions",
      registrations: "sellers/registrations",
      unlocks: "sellers/unlocks",
      passwords: "sellers/passwords",
      omniauth: "sellers/omniauth",
      confirmations: "sellers/confirmations"
  } do

  end

  devise_scope :seller do
    delete 'delete_attachment' => 'sellers/registrations#delete_attachment'

  end

  devise_for :rootadmins, controllers: {
      sessions: "rootadmins/sessions",
      registrations: "rootadmins/registrations",
      unlocks: "rootadmins/unlocks",
      passwords: "rootadmins/passwords",
      omniauth: "rootadmins/omniauth",
      confirmations: "rootadmins/confirmations"
  } do
  end

  devise_scope :rootadmin do
    get "/rootadmins" => "rootadmins/sessions#new"
  end

  resources :products, only: [:index, :destroy, :update, :new, :create] do
    collection do
      put 'delete_attachment'
    end
  end
  get 'products/:name', to: 'products#show', as: 'show_product'
  get 'products/:name/edit', to: 'products#edit', as: 'edit_product'

  get 'category_slide_images/create'

  get 'twocategories/index'
  post 'products/form_render'

  resources :categories do
    resources :twocategories, :only => :create
    collection do
      put 'delete_attachment'
    end

  end

  resources :twocategories do
    resources :threecategories, :only => :create
    collection do
      put 'delete_attachment'
    end
  end

  resources :threecategories do
    collection do
      put 'delete_attachment'
    end
  end
end