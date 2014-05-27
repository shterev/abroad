Abroad::Application.routes.draw do
  resources :users, only: %i(index show create update destroy)
end
