Linus::Application.routes.draw do
  devise_for :editors
  resources :editors

  get "home/index"

  resources :articles, :only => [:index, :show]

  resources :assignments do
    resources :submissions
  end

  resources :issues

  resources :ideas do
    member do
      get 'assign'
      put 'update_assignment'
    end
    get :autocomplete_writer_name, :on => :collection
    get :autocomplete_writer_email, :on => :collection
  end

  resources :writers do
    member do
      get 'list_assignments'
      get 'remind'
    end
    get 'remind_all', :on => :collection
  end

  resources :submissions

  authenticated :editor do
    root :to => 'home#index'
  end

  root :to => 'home#index'
end
