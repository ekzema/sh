Rails.application.routes.draw do

  resources :messages
  resources :dialogs, only: [:create]
  get 'seller_panel/dialogs/:id', to: 'dialogs#show', as: 'seller_dialogs'
  resources :favorites, only: [:create, :destroy]
  resources :feeds, except: [:new, :index, :show]
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
    get 'feedback'
    delete 'delete_attachment_product'
    delete 'delete_attachment_seller'
    post 'form_render'
  end

  delete 'admin_panel/delete_seller/:id', to: 'admin_panel#delete_seller'
  delete 'admin_panel/delete_product/:id', to: 'admin_panel#delete_product'

  get 'admin_panel/:name/edit_seller', to: 'admin_panel#edit_seller', as: 'edit_seller_admin_panel'
  put 'admin_panel/:name/update_seller', to: 'admin_panel#update_seller', as: 'update_seller_admin_panel'
  get 'admin_panel/:name/edit_product', to: 'admin_panel#edit_product', as: 'edit_product_admin_panel'
  put 'admin_panel/:name/update_product', to: 'admin_panel#update_product', as: 'update_product_admin_panel'

  get '/about' => 'welcome#about'
  get '/vip' => 'welcome#vip'
  get '/feedback' => 'welcome#feedback'
  get 'seller_products/:id', to: 'welcome#seller_products', as: 'seller_products'


  get 'seller_panel/product'
  get 'seller_panel/favorites', to: 'seller_panel#favorite'
  get 'seller_panel/vipstatus'
  get 'seller_panel/dialogs', to: 'seller_panel#dialogs'
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

  resources :products, except: [:index] do
    collection do
      delete 'delete_attachment/:product_img', to: 'products#delete_attachment', as: 'delete_image'
    end
  end

  get 'category_slide_images/create'

  get 'twocategories/index'
  post 'products/form_render'

  resources :categories, except: [:show, :index] do
    collection do
      delete 'delete_attachment'
    end
  end
  get 'category/:name', to: 'categories#show', as: 'showcat'

  resources :twocategories, except: [:show, :index] do
    collection do
      delete 'delete_attachment'
    end
  end
  get 'category/:category_name/:name', to: 'twocategories#show', as: 'showtwocat'

  resources :threecategories, except: [:show, :index] do
    collection do
      delete 'delete_attachment'
    end
  end
  get 'category/:category_name/:twocategory_name/:name', to: 'threecategories#show', as: 'showthreecat'

end
