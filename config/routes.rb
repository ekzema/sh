Rails.application.routes.draw do
  root 'welcome#index'

  get 'twocategories/index'

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
