Abroad::Application.routes.draw do
  scope constraints: {format: :json} do
    resources :users, except: %i(new edit)
    resources :events, except: %i(new edit)
  end
end
