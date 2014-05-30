Abroad::Application.routes.draw do
  resources :users, except: %i(new edit)
  resources :events, except: %i(new edit)
end
