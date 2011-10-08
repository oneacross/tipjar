Tipjar::Application.routes.draw do
  get "requests/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :requests

  root :to => 'requests#index'

end
