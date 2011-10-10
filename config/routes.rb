Tipjar::Application.routes.draw do
  get "requests/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :requests

  resources :openids do
    collection do
      get 'complete'
    end
  end

  root :to => 'requests#index'

end
