Rails.application.routes.draw do


  root 'welcome#index'

  get '/all' => 'welcome#all'
  get 'seller_panel/product'
  devise_for :sellers, controllers: {
      sessions: "sellers/sessions",
      registrations: "sellers/registrations",
      unlocks: "sellers/unlocks",
      passwords: "sellers/passwords",
      omniauth: "sellers/omniauth",
      confirmations: "sellers/confirmations"
  } do
  get '/sellers/sign_out' => 'devise/sessions#destroy'
  put 'delete_attachment'
end

  resources :products do
    collection do
      put 'delete_attachment'
    end
  end

  get 'category_slide_images/create'

  get 'twocategories/index'
  post 'products/form_render'

  resources :categories do
    resources :twocategories, :only => :create
    collection do
      put 'delete_attachment'
    end

  end

  resources :twocategories, :only => [:index, :show, :edit, :update, :destroy] do
    resources :threecategories, :only => :create
  end

  resources :threecategories, :only => [:index, :show, :edit, :update, :destroy]

end
