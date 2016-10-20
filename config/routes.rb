Rails.application.routes.draw do
  devise_for :sellers
  resources :products
  get 'category_slide_images/create'

  root 'welcome#index'

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
